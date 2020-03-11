//
//  Cashier.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/11.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Cashier {
    
    private var balance = Quantity.zero
    var currentBalance: Int {
        return balance
    }
    
    func subtract(price: Int) {
        balance -= price
    }
    
    func plus(money: Int) {
        balance += money
    }
    
    func isEnoughToBuy(price: Int) -> Bool {
        return balance >= price
    }

}
