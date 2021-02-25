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
    
    func add(beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func show(handler: (Beverage) -> Void) {
        self.beverages.forEach { 
            handler($0)
        }
    }
}
