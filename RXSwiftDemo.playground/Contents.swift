//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa


//MARK: - 创建可观察序列
let numbers = Observable<String>.create { (observer) -> Disposable in
    observer.onNext("0");
    observer.onNext("1");
    observer.onCompleted()
    return Disposables.create();
    }.subscribe(onNext: { (event) in
        print("next打印:\(event)")
    }, onError: nil, onCompleted: {()->Void in print("completed")}, onDisposed: nil)

//MARK: - 创建single 只有两种枚举值   success error
_ = Single<String>.create { (sign) -> Disposable in
    sign(.success("james"))
    return Disposables.create();
    }.subscribe(onSuccess: { (data) in
        print(data)
    }, onError: nil)

