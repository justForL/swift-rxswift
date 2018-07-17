//
//  TestViewController.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/16.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxCocoa
class TestViewController: UIViewController {
    let ViewModel = TestViewModel()
    let provider = MoyaProvider<NetWorkManager>();
    let disposeBag = DisposeBag();

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let data = ViewModel.loadData()
//                        .map{self.title = "\($0?.data?.count ?? 0)"}
//                        .subscribe(onSuccess: { (model) in
//                        print(model)
//                    }, onError: {error in
//                        print(error)
//                    }).disposed(by: disposeBag)
        
        
}

    
}
