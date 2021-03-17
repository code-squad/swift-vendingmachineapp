//
//  VendinMachine.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class VendingMachine: NSObject, NSCoding, VendingMachinable {
    private var drinks: Drinks
    private var cashManagementSystem: CashManagementSystem
    private var purchasedList: PurchasedList
    
    override init() {
        self.drinks = Drinks()
        self.cashManagementSystem = CashManagementSystem()
        self.purchasedList = PurchasedList()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(drinks, forKey: "drinks")
        coder.encode(cashManagementSystem, forKey: "cashManagementSystem")
        coder.encode(purchasedList, forKey: "purchasedList")
    }
    
    required init?(coder: NSCoder) {
        drinks = coder.decodeObject(forKey: "drinks") as! Drinks
        cashManagementSystem = coder.decodeObject(forKey: "cashManagementSystem") as! CashManagementSystem
        purchasedList = coder.decodeObject(forKey: "purchasedList") as! PurchasedList
        
    }
    
    func addStock(as beverage: Beverage) {
        drinks.add(with: beverage)
        NotificationCenter.default.post(name: .addStockButton, object: self)
    }

    func rechargeCash(with cash: Int) {
        cashManagementSystem.increaseCash(with: cash)
        NotificationCenter.default.post(name: .rechargeButton, object: self)
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
    
    func showStock() -> [ObjectIdentifier:[Beverage]] {
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

protocol VendingMachinable {
    func addStock(as beverage: Beverage)
    func rechargeCash(with cash: Int)
    func showStock() -> [ObjectIdentifier:[Beverage]]
    func showBalance() -> CashManagementSystem
}
