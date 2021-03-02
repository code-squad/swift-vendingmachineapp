//
//  VendinMachine.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class VendingMachine {
    private var drinks: Drinks
    private var cashManagementSystem: CashManagementSystem
    init() {
        self.drinks = Drinks()
        self.cashManagementSystem = CashManagementSystem()
    }
    
    func addStock(beverage: Beverage) {
        drinks.add(with: beverage)
    }
    
    func retreiveDrinks(completion: (Beverage)->Void) {
        drinks.retrieveBeverage(completion: completion)
    }
    func rechargeCash(with cash: Int) {
        cashManagementSystem.recharge(with: cash)
    }
    
    func showListForPurchase() -> [Beverage] {
        return cashManagementSystem.showListForPurchase(with: drinks)
    }
    
    func buy(_ beverage: Beverage) {
        if cashManagementSystem.isAvailableForPurchase(with: beverage) {
            cashManagementSystem.decreaseCash(with: beverage)
            drinks.remove(with: beverage)
        }
    }
    func showBalance() -> Int {
        return cashManagementSystem.checkBalance()
    }
    
    func showStock() -> [Beverage:Int] {
        drinks.giveStockList()
    }
    func showExpiredStock() -> [Beverage] {
        drinks.giveExpiredList()
    }
    func showHotBeverageList() -> [Beverage] {
        
    }
}
