//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class VendingMachine: NSObject,VendingMachineManagable, NSCoding {
    
    private var moneyManager: MoneyManagable
    private var inventoryManager: InventoryManagable
    private var purchaseHistoryManager: PurchaseHistoryManagable
    
    init(moneyManager: MoneyManagable, inventoryManager: InventoryManagable, purchaseHistoryManager: PurchaseHistoryManagable) {
        self.moneyManager = moneyManager
        self.inventoryManager = inventoryManager
        self.purchaseHistoryManager = purchaseHistoryManager
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.moneyManager, forKey: "moneyManager")
        coder.encode(self.inventoryManager, forKey: "inventoryManager")
        coder.encode(self.purchaseHistoryManager, forKey: "purchaseHistoryManager")
    }
    
    required init?(coder: NSCoder) {
        self.moneyManager = coder.decodeObject(forKey: "moneyManager") as! MoneyManagable
        self.inventoryManager = coder.decodeObject(forKey: "inventoryManager") as! InventoryManagable
        self.purchaseHistoryManager = coder.decodeObject(forKey: "purchaseHistoryManager") as! PurchaseHistoryManagable
    }
    
    func readBalance() -> Int {
        return moneyManager.readBalance()
    }
    
    func increaseBalance(_ price: Int) {
        moneyManager.increaseBalance(price)
    }
    
    func tagToBeverageType(by tag: Int) -> Beverage.Type? {
        return inventoryManager.tagToBeverageType(by: tag)
    }
    
    func tagToMoneyInputType(by tag: Int) -> Money.Input? {
        return inventoryManager.tagToMoneyInputType(by: tag)
    }
    
    func readInventoryCount(index: Int, allInventores: [ObjectIdentifier : [Beverage]]) -> Int {
        return inventoryManager.readInventoryCount(index: index, allInventores: allInventores)
    }
    
    func purchaseBeverage(beverage: Beverage) {
        guard beverage.isPurchasable(balance: moneyManager.readBalance()) else { return }
        
        if let purchased: Beverage = inventoryManager.removeBeverage(beverage) {
            self.purchaseHistoryManager.addPurchased(purchased)
            self.moneyManager.decreaseBalance(purchased.price)
        }
    }
    
    func readInventores() -> [ObjectIdentifier : [Beverage]] {
        inventoryManager.readInventores()
    }
    
    func addBeverage(_ beverage: Beverage) {
        inventoryManager.addBeverage(beverage)
    }
}
