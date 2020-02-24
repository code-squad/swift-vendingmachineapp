//
//  Stock.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/24.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Stock {
    private(set) var stockOf: [BeverageType: [Beverage]] = [:]
    
    init() {
        
    }
    
    func numberOfBeverage(type: BeverageType) -> Int {
        return (stockOf[type] ?? []).count
    }
    
    func dequeue(beverage: Beverage) -> Beverage {
        let beverageType = BeverageType(of: beverage)
        return stockOf[beverageType]!.removeFirst()
    }
    
    func enqueue(beverage: Beverage) {
        let beverageType = BeverageType(of: beverage)
        var beverages = stockOf[beverageType] ?? []
        beverages.append(beverage)
        stockOf[beverageType] = beverages
    }
}
