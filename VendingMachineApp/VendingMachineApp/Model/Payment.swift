//
//  Payment.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/24.
//

import Foundation

class Payment {
    private var amountMoney : Int
    
    init() {
        self.amountMoney = 0
    }
    
    func increaseMoney(money : Int) {
        self.amountMoney += money
    }
}
