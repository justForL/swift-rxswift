//
//  TestModel.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/16.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import Foundation
import ObjectMapper
struct TestModel: Mappable {
    var data: [Cards]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        data <- map["data"];
    }
}

struct Cards: Mappable {
    var column_url: String?
    var end_time: TimeZone?
    var id: Int?
    var start_time: TimeZone?
    var title: String?
    var arr: [Item]?
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        column_url <- map["column_url"];
        end_time <- map["end_time"];
        id <- map["id"];
        start_time <- map["start_time"];
        title <- map["title"];
        column_url <- map["column_url"];
        arr <- map["arr"];
    }
}

struct Item: Mappable {
    var created_at: Int?
    var detail: String?
    var id: Int?
    var name: String?
    var total: Int?
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        created_at <- map["created_at"];
        detail <- map["detail"];
        id <- map["id"];
        name <- map["name"];
        total <- map["total"];
        total <- map["total"];
    }
    
}
