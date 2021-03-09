//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

struct VendingMachine {
    
    private var inventory: Inventory
    private var cashBox: CashBox
    private var soldItems: PurchaseHistory
    
    init(numberOfSlots: Int) {
        self.inventory = Inventory(numberOfSlots: numberOfSlots)
        self.cashBox = CashBox(totalRevenue: 0, moneyDeposited: 0)
        self.soldItems = PurchaseHistory()
    }
    
    mutating func insertMoney(amount: Int) {
        cashBox.insertMoney(amount: amount)
    }
    
    func add(item: Beverage) {
        inventory.add(item)
    }
    
    func showPurchasableItemsWithDeposit() -> [Slot] {
        var purchasableItems: [Slot] = []
        inventory.showSlots {
            if $0.isSameOrCheaper(than: cashBox.showRemainingBalance()) {
                purchasableItems.append($0)
            }
        }
        return purchasableItems
    }
    
    mutating func vend(itemNamed name: String) -> Beverage? {
        var vendedItem: Beverage?
        inventory.showSlots {
            if $0.compareName(with: name) {
                vendedItem = $0.dropFirstItem()
            }
        }
        if let vendedItem = vendedItem {
            cashBox.increaseRevenue(by: vendedItem.price)
            let now = Date()
            let newOrder = Order(purchased: now, item: vendedItem)
            soldItems.add(newOrder)
        }
        return vendedItem
    }
    
    func showBalance() -> Int {
        return cashBox.showRemainingBalance()
    }
    
    func takeInventory() -> [Slot : Int] {
        return inventory.takeStock()
    }
    
    func showExpiredItems() -> [Beverage] {
        var expiredItems: [Beverage] = []
        inventory.showSlots {
            expiredItems += $0.getExpiredItems()
        }
        return expiredItems
    }
    
    func showHotDrinks() -> [Slot] {
        inventory.filterHotDrinks()
    }
    
    func showPurchaseHistory() -> PurchaseHistory {
        return soldItems
    }
}
