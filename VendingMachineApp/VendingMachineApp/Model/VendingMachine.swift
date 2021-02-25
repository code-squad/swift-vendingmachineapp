//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

struct VendingMachine {
    private var drink : Drink
    private var payment : Payment
    private var purchasedList : PurchasedList
    
    init() {
        self.drink = Drink()
        self.payment = Payment()
        self.purchasedList = PurchasedList()
    }
    
    func showBeverageList(handler : (Beverage) -> Void) {
        drink.showBeverageList {
            handler($0)
        }
    }
    
    func putPayMoney(money : Int) {
        payment.increaseAmountMoney(money: money)
    }
    
    func addBevergeStock(beverage : Beverage) {
        drink.addStock(beverage : beverage)
    }
    
    func showPurchasePossibleList(handler : ([Beverage]) -> Void) {
        payment.purchasePossibleList(drink: drink) {
            handler($0)
        }
    }
    
    mutating func purchaseBeverage(beverage : Beverage) {
        if payment.checkBalance(beverage: beverage) {
            payment.decreaseAmountMoney(beverage: beverage)
            drink.purchaseBeverage(beverage: beverage)
            purchasedList.addBeverage(beverage: beverage)
        }
    }
    
    func checkCurrentBalance() -> Int {
        return payment.amountMoney
    }
    
    func purchaseHistory() -> [Beverage] {
        return purchasedList.purchasedList
    }
}
