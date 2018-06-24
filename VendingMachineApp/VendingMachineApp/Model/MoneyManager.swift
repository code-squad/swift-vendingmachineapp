//
//  MoneyManager.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class MoneyManager: MoneyManagable {
    private var balance: Int = 0
    
    func readBalance() -> Int {
        return self.balance
    }
    
    func increaseBalance(_ price: Int) {
        self.balance += price
    }
    
    func decreaseBalance(_ price: Int) {
        self.balance -= price
    }
}
