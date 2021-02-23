//
//  MoneyReceiver.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class PaymentValidator {
    private var money: Int
    
    init() {
        money = 0
    }
    
    public func receive(money: Int) {
        self.money += money
    }
    
    public func showsDeposit() -> Int {
        return money
    }
}
