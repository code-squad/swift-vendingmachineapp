//
//  Payment.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/24.
//

import Foundation

class Payment {
    private(set) var amountMoney : Int
    
    init() {
        self.amountMoney = 0
    }
        
    func purchasePossibleList(drink : Drink) -> [Beverage] {
        return drink.purchasePossibleList(currentMoney: amountMoney)
    }
    
    func checkBalance(beverage : Beverage) -> Bool {
        return amountMoney >= beverage.price
    }
    
    func increaseAmountMoney(money : Int) {
        self.amountMoney += money
    }
    
    func decreaseAmountMoney(beverage : Beverage) {
        return amountMoney -= beverage.price
    }
}
