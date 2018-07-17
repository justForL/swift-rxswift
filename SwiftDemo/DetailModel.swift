//
//  DetailModel.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/11.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import UIKit
import ObjectMapper
class DetailModel: Mappable {

    var id: Int = 0
    var total: Int = 0
    var name: String?
    var detail: String?
    var created_at:Int = 0
    
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        total <- map["total"]
        name <- map["name"]
        detail <- map["detail"]
        created_at <- map["created_at"]
    }
}
