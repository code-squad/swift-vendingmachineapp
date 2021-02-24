//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import Foundation

class VendingMachine {
    private var stockBeverages: [Beverage]
    
    init() {
        self.stockBeverages = [Beverage]()
    }
    
    public func appendBeverage(_ beverage: Beverage) {
        stockBeverages.append(beverage)
    }
    
    // 1단계 이후 지워질 것
    public func printStockBeverages() {
        stockBeverages.forEach { (beverage) in
            print(beverage)
        }
    }
}
