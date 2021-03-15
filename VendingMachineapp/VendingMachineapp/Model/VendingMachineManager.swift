//
//  VendingMachineManager.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

class VendingMachineManager: NSObject, NSCoding {

    private var purchaseHistory: [Beverage]
    
    override init() {
        purchaseHistory = []
    }
    
    required init?(coder: NSCoder) {
        self.purchaseHistory = coder.decodeObject(forKey: "purchaseHistory") as? [Beverage] ?? []
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(purchaseHistory, forKey: "purchaseHistory")
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
