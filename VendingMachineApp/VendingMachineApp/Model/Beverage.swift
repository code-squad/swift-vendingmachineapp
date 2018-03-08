//
//  Beverage.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    var kindOf: String
    var brand: String
    var weight: Int
    var price: Int
    var name: String
    var manufactureDate: Date
    init() {
        kindOf = ""
        brand = ""
        weight = 0
        price = 0
        name = ""
        manufactureDate = Date()
    }
    
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date) {
        self.kindOf = "음료"
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.manufactureDate = manufactureDate.addingTimeInterval(21600)
    }
    var description: String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyyMMdd"
        let manufactureDateByFormat = dateFormat.string(from: self.manufactureDate as Date)
        return "\(self.brand), \(self.weight)ml, \(self.price)원, \(self.name), \(manufactureDateByFormat)"
    }
}
