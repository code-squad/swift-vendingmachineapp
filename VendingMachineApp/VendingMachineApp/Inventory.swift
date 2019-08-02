//
//  Inventory.swift
//  VendingMachine
//
//  Created by 김성현 on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import UIKit

struct Inventory {
    
    private var storage = [String: Beverage]()
    
    var allBeverages: [Beverage] {
        return Array(storage.values)
    }
    
    
    subscript (name: String) -> Beverage {
        get {
            guard let beverage = storage[name] else {
                fatalError("잘못된 음료 이름이 전달됨")
            }
            return beverage
        }
    }
    
    mutating func addBeverage(_ beverage: Beverage, manufactureDate: Date = Date()) {
        if storage[beverage.name] == nil {
            storage[beverage.name] = beverage
        }
        self[beverage.name].addBeverage(manufactureDate: manufactureDate)
    }
    
//    mutating func removeOneBeverage(named name: String) -> Date {
//        return self[name].removeBeverage()
//    }
    
    var expiredBeverages: [String: [Date]] {
        return storage.mapValues { $0.expiredBeverages }
    }
    
    var hotBeverages: [Beverage] {
        return storage.values.filter { $0.isHot }
    }
    
}
