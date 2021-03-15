//
//  VendingMachineManager.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

class VendingMachineManager: NSObject, NSCoding {

    private var purchaseList: [Beverage]
    private var purchaseHistory: [Beverage]
    
    override init() {
        purchaseHistory = []
        purchaseList = []
    }
    
    required init?(coder: NSCoder) {
        self.purchaseHistory = coder.decodeObject(forKey: "purchaseHistory") as? [Beverage] ?? []
        self.purchaseList = coder.decodeObject(forKey: "purchaseList") as? [Beverage] ?? []
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(purchaseList, forKey: "purchaseList")
        coder.encode(purchaseHistory, forKey: "purchaseHistory")
    }
    
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
    
    func updatePurchaseList(inventory: Inventory, beverage: Beverage) -> Bool {
        if let remove = inventory.subtract(beverage: beverage) {
            purchaseHistory.append(remove)
            return true
        }
        return false
    }
    
    func purchasedList() -> [Beverage] {
        return purchaseHistory
    }
}
