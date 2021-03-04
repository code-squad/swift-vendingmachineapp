//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class VendingMachine {
    private (set) var moneyManager: MoneyManagable
    private (set) var inventoryManager: InventoryManagable
    private (set) var purchaseHistoryManager: PurchaseHistoryManagable
    
    init(moneyManager: MoneyManagable, inventoryManager: InventoryManagable, purchaseHistoryManager: PurchaseHistoryManagable) {
        self.moneyManager = moneyManager
        self.inventoryManager = inventoryManager
        self.purchaseHistoryManager = purchaseHistoryManager
    }
    
    func purchaseBeverage(beverage: Beverage) {
        guard beverage.isPurchasable(balance: moneyManager.readBalance()) else { return }
        
        if let purchased: Beverage = inventoryManager.removeInventory(beverage) {
            self.purchaseHistoryManager.addPurchased(purchased)
            self.moneyManager.decreaseBalance(purchased.price)
        }
    }
}
