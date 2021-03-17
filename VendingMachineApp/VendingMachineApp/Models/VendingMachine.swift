//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class VendingMachine: NSObject, NSCoding, InventoryTakeable, Archivable, Unarchivable {
    enum Notification {
        static let DidChangeInventory = Foundation.Notification.Name("DidChangeInventory")
        static let DidChangeBalance = Foundation.Notification.Name("DidChangeBalance")
    }
    
    private var inventory: Inventory
    private var cashBox: CashBox
    private var soldItems: PurchaseHistory
    
    init(numberOfSlots: Int) {
        self.inventory = Inventory(numberOfSlots: numberOfSlots)
        self.cashBox = CashBox(totalRevenue: 0, moneyDeposited: 0)
        self.soldItems = PurchaseHistory()
        NotificationCenter.default.post(name: Notification.DidChangeBalance, object: cashBox)
    }
    
    struct PropertyKey {
        static let inventoryKey = "inventory"
        static let cashBoxKey = "cashBox"
        static let soldItemsKey = "soldItems"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(inventory, forKey: PropertyKey.inventoryKey)
        coder.encode(cashBox, forKey: PropertyKey.cashBoxKey)
        coder.encode(soldItems, forKey: PropertyKey.soldItemsKey)
    }
    
    required init?(coder: NSCoder) {
        self.inventory = coder.decodeObject(forKey: PropertyKey.inventoryKey) as? Inventory ?? Inventory(numberOfSlots: 0)
        self.cashBox = coder.decodeObject(forKey: PropertyKey.cashBoxKey) as? CashBox ?? CashBox(totalRevenue: 0, moneyDeposited: 0)
        self.soldItems = coder.decodeObject(forKey: PropertyKey.soldItemsKey) as? PurchaseHistory ?? PurchaseHistory()
    }
    
    func insertMoney(amount: Int) {
        cashBox.insertMoney(amount: amount)
        NotificationCenter.default.post(name: Notification.DidChangeBalance, object: self)
    }
    
    func add(item: Beverage) {
        inventory.add(item)
        NotificationCenter.default.post(name: Notification.DidChangeInventory, object: self)
    }
    
    func bulkInsert(itemFrom factory: BeverageFactory, quantity: Int, manufactured: Date?, expiredAfter: Date?) {
        (0..<quantity).forEach { _ in
            let item = factory.createProduct(manufactured: manufactured, expiredAfter: expiredAfter)
            add(item: item)
        }
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
    
    func vend(itemNamed name: String) -> Beverage? {
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
    
    func showInventorySheet(handler: (Dictionary<Slot, Int>.Element) -> ()) {
        let inventorySheet = self.takeInventory()
        inventorySheet.forEach {
            handler($0)
        }
    }
}
