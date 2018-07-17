//
//  TableViewCell.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/17.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import UIKit
import SnapKit

let TABLEVIEWCELLID = "TableViewCell"
class TableViewCell: UITableViewCell {
    
    /// 对cell赋值
    ///
    /// - Parameter item: item
    func configure(item: TableItemModel) -> Void {
        selectLabel.text = item.isFinished ? "√" : "";
        nameLabel.text = item.name;
    }
    
    fileprivate func setUpUI() {
        contentView.addSubview(selectLabel);
        contentView.addSubview(nameLabel);
    }
    
    fileprivate func snapkitSubviews(){
        selectLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY);
            make.left.equalTo(contentView.snp.left).offset(15);
            make.width.equalTo(10);
            
        }
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(selectLabel.snp.centerY);
            make.left.equalTo(selectLabel.snp.right).offset(10);
            make.right.equalTo(contentView.snp.right).offset(-10);
            make.top.equalTo(contentView.snp.top);
            make.bottom.equalTo(contentView.snp.bottom);
            make.height.equalTo(45).priority(.high);
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        setUpUI();
        snapkitSubviews();
    }
    /// 工厂方法创建cell
    ///
    /// - Parameters:
    ///   - tableView: tableView
    ///   - indexPath: indexPath
    /// - Returns: cell
    static func createCell(tableView: UITableView, indexPath: IndexPath) -> TableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: TABLEVIEWCELLID) as? TableViewCell;
        if cell == nil {
            cell = TableViewCell(style: .default, reuseIdentifier: TABLEVIEWCELLID);
            print(indexPath.row)
        }
        return cell!;
    }
    
    //MARK: - LAZY LOAD
    /// 选择标识
    lazy var selectLabel = {()->UILabel in
        let label = UILabel();
        label.text = "√"
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        label.sizeToFit();
        return label;
    }()
    /// todo名称
    lazy var nameLabel = {()->UILabel in
        let label = UILabel();
        return label;
    }()
}
