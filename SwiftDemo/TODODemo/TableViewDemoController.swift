//
//  TableViewDemoController.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/17.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
class TableViewDemoController: UIViewController {
    let disbag = DisposeBag();
    
    fileprivate var items = BehaviorRelay<[TableItemModel]>(value:[])
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI();
        snapkitSubViews();
        makeObserverable();
        registCell();
    }
    fileprivate func setUpUI() -> Void {
        view.addSubview(tableView);
        view.addSubview(removeButton);
        view.addSubview(addButton);
    }
    fileprivate func registCell() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TABLEVIEWCELLID);
    }
    fileprivate func makeObserverable() {
        items
            .asObservable()
            .subscribe(onNext: { [weak self] todos in
                self?.refreshUI(todos: todos);
            }).disposed(by: disbag);
        items
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: TABLEVIEWCELLID, cellType: TableViewCell.self)){(row, element, cell) in
                
                cell.configure(item: self.items.value[row]);
                
            }.disposed(by: disbag);
        
        
//        tableView.rx
//            .modelSelected(TableItemModel.self)
//            .subscribe { [weak self] (event) in
//                if let item = event.element {
//                    print(item)
//                    let items = self?.items.value;
//                    self?.items.accept([])
//                }
//
//
//
//            }.disposed(by: disbag);
    }
    
    fileprivate func refreshUI(todos:[TableItemModel]) {
        removeButton.isEnabled = !todos.isEmpty
        title = todos.isEmpty ? "请添加事项" : "\(todos.count)"
        tableView.reloadData();
    }
    fileprivate func snapkitSubViews() -> Void {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view);
        }
        removeButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(50);
            make.bottom.equalTo(view.snp.bottom).offset(-50);
            make.left.equalTo(view.snp.left).offset(50);
        }
        addButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(50);
            make.bottom.equalTo(view.snp.bottom).offset(-50);
            make.right.equalTo(view.snp.right).offset(-50);
        }
    }
    
    fileprivate func addItemAction() {
        let i = TableItemModel(name: "item", isFinished: false);
        items.accept(items.value + [i])
    }
    private lazy var tableView = {()-> UITableView in
        let tableView = UITableView(frame: CGRect.zero, style: .plain);
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 45;
        return tableView;
        
    }()
    
    private lazy var removeButton = {()->UIButton in
        let btn = UIButton(frame: CGRect.zero);
        btn.setTitle("清空", for: .normal);
        btn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        btn.layer.cornerRadius=25;
        btn.layer.masksToBounds = true;
        btn.rx.tap.subscribe(onNext: {  [weak self] in
           print("清空 click")
            self?.items.accept([]);
        }).disposed(by: disbag);
        return btn;
    }()
    
    private lazy var addButton = {()->UIButton in
        let btn = UIButton(frame: CGRect.zero);
        btn.setTitle("添加", for: .normal);
        btn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        btn.layer.cornerRadius=25;
        btn.layer.masksToBounds = true;
        btn.rx.tap.subscribe(onNext: {  [weak self] in
            print("添加 click")
            self?.addItemAction();
        }).disposed(by: disbag);
        return btn;
    }()
    
    deinit {
        print("deinit")
    }
}

