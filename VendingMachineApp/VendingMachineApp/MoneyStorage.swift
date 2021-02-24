//
//  MoneyStorage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class MoneyStorage: MoneyExchangable {
    var money: Int
    
    init() {
        money = 0
    }
    
    func increaseMoney(by amount: Int) {
        money += amount
    }
    
    func deductMoney(by amount: Int) {
        money -= amount
    }
    
    public func exportCurrentBalance() -> Int {
        return money
    }
    
    func sendMoney(amount: Int, to counterPart: MoneyExchangable) {
        self.deductMoney(by: amount)
        counterPart.increaseMoney(by: amount)
    }
}
