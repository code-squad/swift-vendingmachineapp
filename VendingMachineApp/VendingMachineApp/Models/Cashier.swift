//
//  Cashier.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/07.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

protocol Calculable {
    func balance() -> Int
    func addToBalance(_ money: Int)
    func sell(beverage: Beverage)
    func forEachSalesLog(_ block: (Beverage) -> Void)
}

class Cashier: Calculable {
    private var cash = 0 {
        didSet {
            NotificationCenter.default.post(name: .balanceDidChange, object: self)
        }
    }
    
    private var salesLog = [Beverage]()
    
    func balance() -> Int {
        return cash
    }
    
    func addToBalance(_ money: Int) {
        cash += money
    }
    
    func sell(beverage: Beverage) {
        cash -= beverage.price
        salesLog.append(beverage)
    }
    
    func forEachSalesLog(_ block: (Beverage) -> Void) {
        salesLog.forEach { block($0) }
    }
}
