//
//  VendingMachineManager.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

class VendingMachineManager: NSObject, NSCoding {

    private var purchaseHistory: [Beverage]
    private(set) var money: Money
    
    override init() {
        purchaseHistory = []
        self.money = Money(with: 0)
    }
    
    required init?(coder: NSCoder) {
        self.purchaseHistory = coder.decodeObject(forKey: "purchaseHistory") as? [Beverage] ?? []
        self.money = coder.decodeObject(forKey: "money") as? Money ?? Money(with: 0)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(purchaseHistory, forKey: "purchaseHistory")
        coder.encode(money, forKey: "money")
    }
    
    func updatePurchaseList(inventory: Inventory, beverage: Beverage.Type) {
        if let remove = inventory.subtract(beverage: beverage) {
            purchaseHistory.append(remove)
            money.changeMoney(with: Money(with: -remove.price))
        }
    }
    
    func purchasedList() -> [Beverage] {
        return purchaseHistory
    }
    
    func changeMoney(with money: Money) {
        self.money.changeMoney(with: money)
    }
    
    func checkChange() -> Money {
        return self.money.checkChange()
    }
    
}
