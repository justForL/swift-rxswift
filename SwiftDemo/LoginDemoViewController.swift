//
//  LoginDemoViewController.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/12.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
class LoginDemoViewController: UIViewController {

    fileprivate let userNameMinLength = 5;
    fileprivate let passwordMinLength = 5;
    fileprivate let disposeBag = DisposeBag();
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI();
        snapkitSubViews();
        makeConstains();
    }

    func setUpUI() -> Void {
//        背景色
        view.backgroundColor = UIColor.white;
        
//        添加子控件
        view.addSubview(userNameTf)
        view.addSubview(userNameVaild);
        view.addSubview(passwordTf);
        view.addSubview(passWordVaild)
        view.addSubview(loginBtn);
    }
    
    func snapkitSubViews() -> Void {
        
        userNameTf.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(200);
            make.left.equalTo(view).offset(20);
            make.right.equalTo(view).offset(-20);
        };
        userNameVaild.snp.makeConstraints { (make) in
            make.top.equalTo(userNameTf.snp.bottom).offset(10);
            make.left.right.equalTo(userNameTf);
        };
        passwordTf.snp.makeConstraints { (make) in
            make.top.equalTo(userNameVaild.snp.bottom).offset(10);
            make.left.right.equalTo(userNameVaild);
        };
        passWordVaild.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTf.snp.bottom).offset(10);
            make.left.right.equalTo(passwordTf);
        };
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(passWordVaild.snp.bottom).offset(50);
            make.left.right.equalTo(passWordVaild);
            make.height.equalTo(50);
        }
        
    }
    
    func test(name: String, finshed: @escaping (_ name1: String )->() ) {
        let time = DispatchTime(uptimeNanoseconds: 5);
        DispatchQueue.main.asyncAfter(deadline: time) {
            print("ok");
            finshed("ok2");
        }
    }

    func makeConstains() {
        
        let userNameV = userNameTf.rx.text.orEmpty
                .map{ $0.count >= self.userNameMinLength}
                .share(replay: 1);
        
        let passwordV = passwordTf.rx.text.orEmpty
                .map{$0.count >= self.passwordMinLength}
                .share(replay: 1);
        
        
        userNameV.bind(to: passwordTf.rx.isEnabled)
                .disposed(by: disposeBag);
        
        userNameV.bind(to: userNameVaild.rx.isHidden)
                .disposed(by: disposeBag);
        
        passwordV.bind(to: passWordVaild.rx.isHidden)
                .disposed(by: disposeBag);
        
        passwordV.bind(to: loginBtn.rx.isEnabled)
                .disposed(by: disposeBag);
        userNameV.bind(to: loginBtn.rx.isEnabled)
                .disposed(by: disposeBag);
        
    }
    //MARK: - ButtonClick
    @objc func buttonClick(sender: UIButton){
        showAlert();
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let testVc = TestViewController();
        navigationController?.pushViewController(testVc, animated: true);
    }
    //MARK: - showAlert
    fileprivate func showAlert(){
        view.endEditing(true);
        let alter = UIAlertController(title: "提示", message: "登录成功", preferredStyle: .actionSheet);
        let action = UIAlertAction(title: "确定", style: .default) { (action) in
            
        }
        alter.addAction(action);
        present(alter, animated: true, completion: nil)
    }
    //MARK: - LazyLoad
    fileprivate lazy var userNameTf = { ()->UITextField in
        let tf = makeTextField(textColor: UIColor.black);
        tf.placeholder = "username";
        return tf;
    }()
    fileprivate lazy var passwordTf = { ()->UITextField in
        let tf = makeTextField(textColor: UIColor.black);
        tf.placeholder = "password";
        return tf;
    }()
    fileprivate lazy var userNameVaild = { ()->UILabel in
        let label = makeLabel(textColor: UIColor.red);
        label.text="userNameVaild"
        return label;
    }()
    
    fileprivate lazy var passWordVaild = { ()->UILabel in
        let label = makeLabel(textColor: UIColor.red);
        label.text = "passWordVaild";
        return label;
    }()
    
    fileprivate lazy var loginBtn = { ()->UIButton in
        let btn = UIButton();
        btn.setTitle("点我", for: .normal);
        btn.backgroundColor = UIColor.green;
        btn.layer.cornerRadius = 8;
        btn.layer.masksToBounds = true;
//        btn.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
        btn.rx.tap.subscribe(onNext: { [weak self] in
            self?.showAlert();
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        return btn;
    }()
    
    
    //MARK: - makeFunction
    func makeLabel(textColor:UIColor) -> UILabel {
        let label = UILabel();
        label.textColor = textColor;
        return label;
    }
    
    func makeTextField(textColor:UIColor) -> UITextField {
        let tf = UITextField();
        return tf;
    }

}
