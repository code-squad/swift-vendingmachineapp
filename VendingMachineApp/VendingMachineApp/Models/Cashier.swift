//
//  Cashier.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/11.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol Calculable {
    
    mutating func subtract(price: Int)
    mutating func plus(money: Int)
    func isEnoughToBuy(price: Int) -> Bool
    mutating func addToSalesLog(beverage: Beverage)
    func currentBalance() -> Int
    func searchSalesLog(handler: (Beverage) -> (Void))
    
}

struct Cashier: Calculable {
    
    private var balance = Quantity.zero
    private var salesLog = [Beverage]()
    
    func currentBalance() -> Int {
        return balance
    }
    
    mutating func subtract(price: Int) {
        balance -= price
    }
    
    mutating func plus(money: Int) {
        balance += money
    }
    
    func isEnoughToBuy(price: Int) -> Bool {
        return balance >= price
    }
    
    mutating func addToSalesLog(beverage: Beverage) {
        salesLog.append(beverage)
    }
    
}

extension Cashier {
    
    func searchSalesLog(handler: (Beverage) -> (Void)) {
        salesLog.forEach { handler($0) }
    }
    
}
