//
//  Stock.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/25.
//

import Foundation

class Stock {
    private var beverages: [Beverage]
    
    init() {
        self.beverages = []
    }
    
    func isOutOfStock(beverage: Beverage) -> Bool {
        return true
    }
    
    func add(beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func show() {
        for beverage in beverages {
            print(beverage)
            
        }
    }
}
