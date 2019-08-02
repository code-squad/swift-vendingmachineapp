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
    
    subscript (name: String) -> Beverage {
        get {
            guard let beverage = storage[name] else {
                fatalError("잘못된 음료 이름이 전달됨")
            }
            return beverage
        }
    }
    
    mutating func addBeverageType(_ beverage: Beverage) {
        storage[beverage.name] = beverage
    }
    
    mutating func addBeverage(named name: String, manufactureDate: Date = Date()) {
        storage[name]?.addBeverage(manufactureDate: manufactureDate)
    }
    
    var expiredBeverages: [String: [Date]] {
        return storage.mapValues { $0.expiredBeverages }
    }
    
}
