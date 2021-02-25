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
    
    func showPurchasePossibleList() -> [Beverage] {
        return payment.purchasePossibleList(drink: drink)
    }
    
    func purchaseBeverage(beverage : Beverage) {
        if payment.checkBalance(beverage: beverage) {
            payment.decreaseAmountMoney(beverage: beverage)
            drink.purchaseBeverage(beverage: beverage)
            purchasedList.addBeverage(beverage: beverage)
        }
    }
    
    func showAllBeverageStock() -> [Beverage : Int] {
        return drink.showAllBeverage()
    }
    
    func outOfDateinventory() -> [Beverage] {
        return drink.passExpiryDate()
    }
    
    func verifyHotBeverages() -> [Beverage] {
        return drink.hotDrink()
    }
    
    func checkCurrentBalance() -> Int {
        return payment.amountMoney
    }
    
    func purchaseHistory() -> [Beverage] {
        return purchasedList.purchasedList
    }
}
