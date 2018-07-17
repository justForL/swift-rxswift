//
//  NetWorkManager.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/13.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import Foundation
import Moya

let provider = MoyaProvider<NetWorkManager>();

enum NetWorkManager {
    case getData
    case getChannels
}

extension NetWorkManager: TargetType {
    var baseURL: URL {
//        return URL(string: "http://localhost:8081/")!
        return URL(string: "http://localhost:8081/")!
    }
    
    var path: String {
        switch self {
        case .getData:
            return "TestData/home.json"
        case .getChannels:
            return "j/app/radio/channels"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getData:
            return .get
        case .getChannels:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getData:
            return .requestPlain
        case .getChannels:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
        
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    
}
