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
    
    func availablePurchaseList(inventory: Inventory, money: Int) -> [Beverage] {
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
        purchaseHistory.append(inventory.subtractBeverage(beverage: beverage)!)
    }
    
    func purchasedList() -> [Beverage] {
        return purchaseHistory
    }
    
    func hotBeverageList(inventory: Inventory) -> [Beverage] {
        var list: [Beverage] = []
        
        inventory.eachBeverage(handler: { (beverage) in
            if beverage.isHot(with: 50) {
                list.append(beverage)
            }
        })
        return list
    }
    
    func invalidateList(inventory: Inventory, with date: Date) -> [Beverage] {
        var list: [Beverage] = []
        
        inventory.eachBeverage(handler: { (beverage) in
            if !beverage.validateExpiryTime(with: date) {
                list.append(beverage)
            }
        })
        return list
    }
}
