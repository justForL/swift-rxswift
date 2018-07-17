//
//  ViewController.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/10.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

//http://localhost:8081/testData/home.json
class ViewController: UIViewController {
    let viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        _ = viewModel.getData();
        
        
        
        
        
//        testFunc();
        view.backgroundColor=UIColor.white;
//        requestData();
        
        
//        jumpButton.setTitle("james", for: .normal)
//        jumpButton.center = view.center;
//        view.addSubview(jumpButton)
//       title="123"
//        
//        
//        let p = Person(name: "james", age: 13);
//        print(p);
    }
    @objc func btnClick(sender: UIButton) -> Void {
        let sec = SecondViewController();
//        sec.name = "james"
//        sec.backClosure = {(name:String) -> Void in
//            print(name);
//        };
        
        sec.setaArgs(name: "james", age: 1, finished: { (name, age) in
            print("\(name)...\(age)")
        }) { (name, age) in
            print("\(name)...\(age)")
        }
        
        navigationController?.pushViewController(sec, animated: true);
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        navigationController?.pushViewController(LoginDemoViewController(), animated: true);
//        navigationController?.pushViewController(TestViewController(), animated: true);
        navigationController?.pushViewController(TableViewDemoController(), animated: true)
    }
    /// LAZY Load
    fileprivate lazy var jumpButton = { () -> UIButton in
        let btn = UIButton(frame: CGRect(x: 0, y: 400, width: 100, height: 50))
        btn.backgroundColor=#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1);
        btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside);
        return btn;
    }()
//
//    func tes(_ url:String, nameStr name:String) {
//
//    }
//    func testFunc() -> () {
//
//
//        print(nextDayMyAge(ageFunc: ageFunc, name: "james", age: 27));
//
//
//        let digitNames = [
//            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
//            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
//        ]
//
//        let numbers = [16, 58, 510]
//
//        let strings = numbers.map{(number) -> String in
//            var number = number;
//            var output = "";
//            repeat{
//                output = digitNames[number % 10]! + output;
//                number /= 10;
//            }while number > 0
//            return output;
//        }
//        //        Optional(Swift._SwiftDeferredNSArray)
//        //        print(object_getClass(strings)!);
//        print(strings);
//    }
//    func testFunc(param: String) -> String {
//        return "Hello " + param;
//    }
//
////    函数作为参数参加运算
//    func nextDayMyAge(ageFunc: (Int) ->Int, name: String, age:Int) -> String {
//        let ageNew: Int = ageFunc(age);
//        return "\(name)明年\(ageNew)岁了";
//    }
//
//    func ageFunc(age: Int) -> Int {
//        return age+1;
//    }

}

