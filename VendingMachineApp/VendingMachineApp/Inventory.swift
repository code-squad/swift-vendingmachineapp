//
//  Inventory.swift
//  VendingMachine
//
//  Created by 김성현 on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Inventory: Codable {
    
    private var storage = [String: BeverageItem]()
    
    var allBeverages: [BeverageItem] {
        return Array(storage.values)
    }
    
    subscript(name: String) -> BeverageItem? {
        return storage[name]
    }
    
    mutating func addBeverageType(_ beverage: BeverageItem) {
        if storage[beverage.name] == nil {
            storage[beverage.name] = beverage
        }
    }
    
    mutating func addBeverage(_ beverage: BeverageItem, manufactureDate: Date = Date()) {
        addBeverageType(beverage)
        self[beverage.name]!.addBeverage(manufactureDate: manufactureDate)
    }
    
    var expiredBeverages: [String: [Date]] {
        return storage.mapValues { $0.expiredBeverages }
    }
    
    var hotBeverages: [BeverageItem] {
        return storage.values.filter { $0.isHot }
    }
    
}
