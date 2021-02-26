//
//  StockBeverages.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/26.
//

import Foundation

class StockDrink {
    private(set) var stock: [Drink]
    
    init() {
        stock = [Drink]()
    }
    
    public func add(_ drink: Drink) {
        stock.append(drink)
    }
    
    public func checkBeverage(_ handler: (Drink) -> ()) {
        for drink in stock {
            handler(drink)
        }
    }
}

