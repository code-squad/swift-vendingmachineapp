//
//  PurchaseHistory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/03.
//

import Foundation

class PurchaseHistory: NSObject, PurchaseHistoryManagable, NSCoding {
    
    private var purchased: Inventory
    
    override init() {
        self.purchased = Inventory()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.purchased, forKey: "purchased")
    }
    
    required init?(coder: NSCoder) {
        self.purchased = coder.decodeObject(forKey: "purchased") as? Inventory ?? Inventory()
    }
    
    func addPurchased(_ beverage: Beverage) {
        self.purchased.addBeverage(beverage)
    }
    
    func readHistory() -> [Beverage: Int] {
        var purchasedList = [Beverage: Int]()
        
        self.purchased.fotEachBeverage { beverage in
            purchasedList[beverage, default: 0] += 1
        }
        
        return purchasedList
    }
}
