//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class VendingMachine {
    private let moneyManager: MoneyManagable
    private let inventoryManager: InventoryManagable
    private let purchaseHistoryManager: PurchaseHistoryManagable
    
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
