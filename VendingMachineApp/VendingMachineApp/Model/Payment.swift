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
    
    func purchasePossibleList(drink : Drink, handler : (Beverage) -> Void) {
        drink.purchasePossibleList(currentMoney: amountMoney) {
            handler($0)
        }
    }
    
    func purchaseBeverage(beverage : Beverage, drink : Drink) {
        if checkBalance(beverage: beverage) {
            subtractAmountMoney(beverage: beverage)
            drink.purchaseBeverage(beverage: beverage)
        }
    }
    
    private func checkBalance(beverage : Beverage) -> Bool {
        return amountMoney > beverage.price
    }
    
    private func subtractAmountMoney(beverage : Beverage) {
        return amountMoney -= beverage.price
    }
}
