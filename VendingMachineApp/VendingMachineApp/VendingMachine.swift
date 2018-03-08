//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    private var money: Money
    private var inventory: Inventory
    private let salesHistory: SalesHistory
    
    init() {
        self.money = Money(0)
        self.inventory = Inventory([])
        self.salesHistory = SalesHistory()
    }
}

extension VendingMachine: InventoryCountable {
    func countBeverageQuantity(beverageMenu: BeverageMenu) -> Int {
        return inventory.countBeverage(beverageMenu: beverageMenu)
    }
    
    func countCurrentInventory() -> [BeverageBox] {
        return inventory.fetchListOfBeverage()
    }
}

extension VendingMachine: Userable {
    func insertMoney(coin: Money) throws {
        money = try money.plus(coin: coin)
    }

    func deductMoney(coin: Money) throws {
        money = try money.subtract(coin: coin)
    }

    func countChange() -> Int {
        return money.countChange()
    }

    func buyBeverage(beverageMenu: BeverageMenu) throws {
        let beverage = beverageMenu.makeInstance()
        salesHistory.addSalesHistory(date: DateUtility.today(), beverageMenu: beverageMenu)
        try deductBeverage(beverageMenu: beverageMenu)
        try deductMoney(coin: beverage.price)
    }
}

extension VendingMachine: MachineManagerable {
    func insertBeverage(beverageMenu: BeverageMenu, quantity: Int = 1) {
        inventory = inventory.add(beverageMenu: beverageMenu, quantity: quantity)
    }

    func deductBeverage(beverageMenu: BeverageMenu, quantity: Int = 1) throws {
        inventory = try inventory.deduct(beverageMenu: beverageMenu, quantity: quantity)
    }
    
    func fetchListOfPurchasableBeverages() -> [BeverageBox] {
        return inventory.fetchListOfBeverage().filter ({
            $0.beverageMenu.makeInstance().price <= money
        })
    }
    
    func fetchSalesHistory() -> [String] {
        return salesHistory.historyOfSales()
    }
    
    func fetchListOfHottedBeverage() -> [BeverageMenu] {
        return BeverageMenu.filterHottedBeverages()
    }
    
    func fetchListOfValidDate() -> [BeverageMenu] {
        return BeverageMenu.filterExpireDateOnToday()
    }
    
    func supply(_ defaultQuantity: Int = 1) {
        BeverageMenu.makeQuantity(defaultQuantity)
    }
}
