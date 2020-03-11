//
//  Cashier.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/11.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct Cashier {
    
    private var balance = Quantity.zero
    private var salesLog = [Beverage]()
    
    var currentBalance: Int {
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
