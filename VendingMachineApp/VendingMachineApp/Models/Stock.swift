//
//  Stock.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/24.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Stock {
    private(set) var stockOf: [ObjectIdentifier: Beverages] = [:]
    
    func numberOf(_ beverage: Beverage) -> Int {
        let beverages = stockOf[beverage.objectIdentifier()] ?? Beverages()
        return beverages.beverages.count
    }
    
    func dequeue(beverage: Beverage) -> Beverage {
        return stockOf[beverage.objectIdentifier()]!.dequeue()
    }
    
    func enqueue(beverage: Beverage) {
        let beverages = stockOf[beverage.objectIdentifier()] ?? Beverages()
        beverages.enqueue(beverage: beverage)
        stockOf[beverage.objectIdentifier()] = beverages
    }
}
