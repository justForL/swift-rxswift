//
//  PrimitiveSequence+Extension.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/13.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import UIKit
import ObjectMapper
import Moya
import RxSwift

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    func mapObject<T: BaseMappable>(_ type: T.Type) -> Single<T?> {
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
