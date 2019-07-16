//
//  Inventory.swift
//  VendingMachine
//
//  Created by 김성현 on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias Inventory = [String: Beverages]

extension Inventory {
    var hotBeverages: [String] {
        return self.filter { (_, beverages) in
            if let isHot = beverages.isHot {
                return isHot
            }
            return false
            }.keys.map { $0 }
    }
    
    var expiredBeverages: [Beverage] {
        let allBeverages = self.values.flatMap { $0 }
        return allBeverages.filter { $0.isExpired(targetDate: Date()) }
    }
    
    mutating func addItem(_ beverage: Beverage) {
        if self[beverage.name] == nil {
            self[beverage.name] = [beverage]
        } else {
            self[beverage.name]!.append(beverage)
        }
    }
    
    mutating func addItems(_ beverages: [Beverage]) {
        beverages.forEach { addItem($0) }
    }
}
