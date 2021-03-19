//
//  PurchaseHistory.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/26.
//

import Foundation

class PurchaseHistory: NSObject, NSCoding {
    private(set) var purchasedDrinks: [Drink] = [] {
        willSet {
            guard let drink = newValue.last else {
                return
            }
            let userInfo = ["drinkInfo": drink]
            NotificationCenter.default.post(name: VendingMachine.NotificationName.updatedPurchaseList, object: self, userInfo: userInfo)
        }
    }
    
    override init() {}
    
    required init?(coder: NSCoder) {
        self.purchasedDrinks = coder.decodeObject(forKey: "purchasedDrinks") as! [Drink]
    }

    func encode(with coder: NSCoder) {
        coder.encode(purchasedDrinks, forKey: "purchasedDrinks")
    }
    
    func add(drink: Drink) {
        purchasedDrinks.append(drink)
    }
}
