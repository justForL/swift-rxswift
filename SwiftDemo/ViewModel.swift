//
//  ViewModel.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/13.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya
import ObjectMapper

class ViewModel: BaseViewModel {
    let disposeBag = DisposeBag()
    func getData() -> Void {
        
    _ = provide.rx.request(.getData)
        .mapaaa(Model.self)
        .subscribe{response in
            switch response {
            case .success(let element):
                print(element)
            case .error(let error):
                print(error)
            }
        }
    }
    
    func handleSuccess(response: Response) -> Void {
        do{
            let data = try response.mapJSON(failsOnEmptyData: true) as! [String: Any]
            if let dataArray = data["data"] as? [[String:Any]]{
                let array = Mapper<Model>().mapArray(JSONArray: dataArray)
                print(array);
            }
        }catch{
            
        }
    }
    
    func handleError(error: Error) -> Void {
        
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    func mapaaa<T: BaseMappable>(_ type: T.Type) -> Single<T?> {
        return flatMap { response -> Single<T?> in
            do {
                let any = try response.mapJSON()
                guard let dic = any as? [String: Any] else {
                    return Single<T?>.just(nil)
                }
                let mapper = T(JSON: dic)
                return Single<T?>.just(mapper)
                
            } catch {
                return Single<T?>.just(nil)
            }
        }
    }
}
