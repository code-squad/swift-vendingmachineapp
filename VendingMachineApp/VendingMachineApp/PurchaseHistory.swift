//
//  PurchaseHistory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/03.
//

import Foundation

class PurchaseHistory: PurchaseHistoryManagable {
    
    private var purchased: Inventory
    
    init() {
        self.purchased = Inventory()
    }
    
    func addPurchased(_ beverage: Beverage) {
        self.purchased.addInventory(beverage)
    }
    
    func readHistory() -> [Beverage: Int] {
        var purchasedList = [Beverage: Int]()
        
        self.purchased.fotEachBeverage { beverage in
            purchasedList[beverage, default: 0] += 1
        }
        
        return purchasedList
    }
}
