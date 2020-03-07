//
//  Cashier.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/07.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Cashier {
    private(set) var balance = 0
    private var salesLog = [Beverage]()
    
    func addToBalance(_ money: Int) {
        balance += money
    }
    
    func sell(beverage: Beverage) {
        balance -= beverage.price
        salesLog.append(beverage)
    }
    
    func forEachSalesLog(_ block: (Beverage) -> Void) {
        salesLog.forEach { block($0) }
    }
}
