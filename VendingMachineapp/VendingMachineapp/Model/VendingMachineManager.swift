//
//  VendingMachineManager.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

class VendingMachineManager {
    
    private var purchaseList: [Beverage] = []
    private var purchaseHistory: [Beverage] = []
    
    func availablePurchaseList(inventory: Inventory, money: Money) -> [Beverage] {
        purchaseList.removeAll()
        
        inventory.eachBeverage(handler: { (beverage) in
            if beverage.isAvailablePurchase(with: money) {
                if !purchaseList.contains(beverage) {
                    purchaseList.append(beverage)
                }
            }
        })
        return purchaseList
    }
    
    func updatePurchaseList(inventory: Inventory, beverage: Beverage) {
        purchaseHistory.append(inventory.subtract(beverage: beverage)!)
    }
    
    func purchasedList() -> [Beverage] {
        return purchaseHistory
    }
}
