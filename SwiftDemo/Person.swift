//
//  Person.swift
//  SwiftDemo
//
//  Created by xianlai on 2018/7/11.
//  Copyright © 2018年 xianlai. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String?;
    var age = 18;
    
    init(name: String, age:Int) {
        self.name=name;
        self.age=age;
    }
}
