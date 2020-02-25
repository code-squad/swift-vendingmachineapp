//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class VendingMachine{
    private var beverages: Beverages
    private var balance: Int
    
    init() {
        self.beverages = Beverages()
        self.balance = 0
    }
    
    func insertBeverage(beverage: Beverage) {
        beverages.addBeverage(beverage: beverage)
    }
    
    func forEachBeverages(_ transfrom: (Beverage) -> ()) {
        beverages.forEachBeverages{
            transfrom($0)
        }
    }
    
    func addBalance(balance: Int) {
        self.balance += balance
    }
}
