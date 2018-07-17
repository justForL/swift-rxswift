//
//  Model.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/11.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import UIKit
import ObjectMapper
class Model: Mappable {
    //id
    var id: Int = 0
    //标题
    var title: String?
    //图片
    var column_url: String?
    //开始时间
    var start_time: TimeInterval?
    //结束时间
    var end_time: TimeInterval?
    //组中cell魔性
    var arr:[DetailModel]?
    
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        column_url <- map["column_url"]
        start_time <- map["start_time"]
        end_time <- map["end_time"]
        arr <- map["arr"]
    }
}
