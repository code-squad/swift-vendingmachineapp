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
    private var purchasedList: PurchasedList
    
    init() {
        self.drinks = Drinks()
        self.cashManagementSystem = CashManagementSystem()
        self.purchasedList = PurchasedList()
    }
    
    func addStock(as beverage: Beverage) {
        drinks.add(with: beverage)
    }

    func rechargeCash(with cash: Int) {
        cashManagementSystem.recharge(with: cash)
    }
    
    func showListForPurchase() -> Drinks {
        return drinks.showListForPurchase(with: cashManagementSystem)
    }
    
    func buy(_ beverage: Beverage) {
        if cashManagementSystem.isAvailableForPurchase(with: beverage) {
            cashManagementSystem.decreaseCash(with: beverage)
            purchasedList.add(with: drinks.remove(with: beverage))
        }
    }
    
    func showBalance() -> CashManagementSystem {
        return cashManagementSystem.checkBalance()
    }
    
    func showStock() -> [Beverage:Int] {
        drinks.giveStockList()
    }
    
    func showExpiredStock() -> Drinks {
        drinks.giveExpiredList()
    }
    
    func showHotBeverageList() -> Drinks {
        drinks.giveHotBeverageList()
    }
    
    func showPurchasedList() -> PurchasedList {
        purchasedList.givePurchasedList()
    }
}
