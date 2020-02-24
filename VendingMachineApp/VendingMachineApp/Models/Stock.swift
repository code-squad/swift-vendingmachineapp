//
//  Stock.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/24.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Stock {
    private(set) var stockOf: [Beverage: Int] = [:]
    
    func numberOf(_ beverage: Beverage) -> Int {
        return stockOf[beverage] ?? 0
    }
    
    func dequeue(beverage: Beverage) {
        stockOf[beverage] = stockOf[beverage]! - 1
    }
    
    func enqueue(beverage: Beverage) {
        stockOf[beverage] = (stockOf[beverage] ?? 0) + 1
    }
}
