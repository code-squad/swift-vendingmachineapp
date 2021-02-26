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
        
    func purchasePossibleList(drinks : Drinks) -> [Beverage] {
        return drinks.purchasePossibleList(money: amountMoney)
    }
    
    func checkPossiblePurchase(beverage : Beverage) -> Bool {
        return beverage.isPossiblePurchase(money: amountMoney)
    }
    
    func increase(money : Int) {
        self.amountMoney += money
    }
    
    func decrease(beverage : Beverage) {
        return amountMoney -= beverage.price
    }
}
