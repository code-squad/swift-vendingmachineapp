//
//  Inventory.swift
//  VendingMachine
//
//  Created by 김성현 on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Inventory: Codable {
    
    private var storage = [String: BeverageWithPhoto]()
    
    var allBeverages: [BeverageWithPhoto] {
        return Array(storage.values)
    }
    
    subscript(name: String) -> BeverageWithPhoto? {
        return storage[name]
    }
    
    mutating func addBeverageType(_ beverage: BeverageWithPhoto) {
        if storage[beverage.name] == nil {
            storage[beverage.name] = beverage
        }
    }
    
    mutating func addBeverage(_ beverage: BeverageWithPhoto, manufactureDate: Date = Date()) {
        addBeverageType(beverage)
        self[beverage.name]!.addBeverage(manufactureDate: manufactureDate)
    }
    
    var expiredBeverages: [String: [Date]] {
        return storage.mapValues { $0.expiredBeverages }
    }
    
    var hotBeverages: [Beverage] {
        return storage.values.filter { $0.isHot }
    }
    
}
