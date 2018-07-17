//
//  SecondViewController.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/11.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import UIKit

typealias callBackClosure = (_ name: String)-> Void;

class SecondViewController: UIViewController {
    
    var backClosure: callBackClosure?
    var name: String?;
    var age: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI();
        snapkitSubViews();
    }

    private func setUpUI() -> Void {
        jumpButton.setTitle("james", for: .normal)
        jumpButton.center = view.center;
        view.backgroundColor=UIColor.white;
        view.addSubview(jumpButton);
        title = name;
        
    }
    
    private func snapkitSubViews() -> Void {
        
    }
    
    func setaArgs(name: String, age: Int, finished:@escaping (_ name1: String, _ age1:Int)->Void, failed:(_ name:String, _ age:Int)->Void){
        self.name = name;
        self.age = age;
        if age > 10 {
            finished(name,age);
        }else{
            failed("error",404);
        }
        
    }
    @objc func btnClick(sender: UIButton) -> Void {

        if backClosure != nil && name != nil{
            backClosure!(self.name!+"123");
        }
        navigationController?.popViewController(animated: true);
    }
    
    /// LAZY Load
    fileprivate lazy var jumpButton = { () -> UIButton in
        let btn = UIButton(frame: CGRect(x: 0, y: 400, width: 100, height: 50))
        btn.backgroundColor=#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1);
        btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside);
        return btn;
    }()

}
