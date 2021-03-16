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
    
    func addPurchased(_ beverageType: Beverage.Type) {
        self.purchased.addBeverage(beverageType)
        NotificationCenter.default.post(name: VendingMachine.NotificationName.didChangeInventory, object: nil)
    }
    
    func readPurchased() -> InventoryManagable {
        return self.purchased
    }
    
    func forEachPurchased(handler: (Beverage) -> ()) {
        self.purchased.forEachBeverage { beverage in
            handler(beverage)
        }
    }
    
    func readHistory() -> [ObjectIdentifier: [Beverage]] {
        var purchasedList = [ObjectIdentifier: [Beverage]]()
        
        self.purchased.forEachBeverage { beverage in
            let beverageType = ObjectIdentifier(type(of: beverage))
            purchasedList[beverageType, default: [Beverage]()].append(beverage)
        }
        
        return purchasedList
    }
}
