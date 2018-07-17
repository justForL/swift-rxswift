//
//  TabeleItemModel.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/17.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import Foundation
import ObjectMapper
struct TableItemModel:Mappable {
    init?(map: Map) {
    }
    init(name: String, isFinished: Bool) {
        self.name = name;
        self.isFinished = isFinished;
    }
    mutating func mapping(map: Map) {
        name <- map["name"];
        isFinished <- map["isFinished"]
    }
    
    var name: String?
    var isFinished = false;
}
