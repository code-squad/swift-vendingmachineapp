//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

struct VendingMachine {
    
    private let numberOfSlots: Int
    private var inventory: Inventory
    private var moneyDeposited: Int
    private var soldItems: PurchaseHistory
    
    init(numberOfSlots: Int) {
        self.numberOfSlots = numberOfSlots
        self.inventory = Inventory(for: numberOfSlots)
        self.moneyDeposited = 0
        self.soldItems = PurchaseHistory()
    }
    
    mutating func insertMoney(amount: Int) {
        moneyDeposited += amount
    }
    
    func add(item: Beverage, slotNumber: Int) {
        inventory.add(item, at: slotNumber)
    }
    
    func showPurchasableItemsWithDeposit() -> [Slot] {
        var purchasableItems: [Slot] = []
        inventory.showSlots {
            if $0.isCheaper(than: moneyDeposited) {
                purchasableItems.append($0)
            }
        }
        return purchasableItems
    }
    
    mutating func vend(itemNamed name: String) -> Beverage? {
        var vendedItem: Beverage?
        inventory.showSlots {
            if $0.compareName(with: name) {
                vendedItem = $0.dropFirstItem(named: name)
            }
        }
        if let vendedItem = vendedItem {
            moneyDeposited -= vendedItem.price
            let now = Date()
            let newOrder = Order(purchased: now, item: vendedItem)
            soldItems.add(newOrder)
        }
        return vendedItem
    }
    
    func showBalance() -> Int {
        return moneyDeposited
    }
    
    func takeInventory() -> [Int : (Slot, Int)] {
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
        var hotDrinks: [Slot] = []
        inventory.showSlots {
            if $0.isHotDrink() {
                hotDrinks.append($0)
            }
        }
        return hotDrinks
    }
    
    func showPurchaseHistory() -> PurchaseHistory {
        return soldItems
    }
}
