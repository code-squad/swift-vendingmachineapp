//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/02.
//

import Foundation

class Inventory: InventoryManagable {
    
    private var inventory: [Beverage]
    
    init(inventory: [Beverage]) {
        self.inventory = inventory
    }
    
    convenience init() {
        let inventory: [Beverage] = []
        self.init(inventory: inventory)
    }
    
    func addInventory(_ beverage: Beverage) {
        self.inventory.append(beverage)
    }
    
    func isPurchasableInventory(balance: Int) -> InventoryManagable {
        return Inventory(inventory: self.inventory.filter { $0.isPurchasable(balance: balance) })
    }
    
    func removeInventory(_ beverage: Beverage) -> Beverage? {
        guard let index = inventory.firstIndex(of: beverage) else { return  nil }
        
        return inventory.remove(at: index)
    }
    
    func fotEachBeverage(handler: (Beverage) -> ()) {
        self.inventory.forEach { beverage in
            handler(beverage)
        }
    }
    
    func expiredBeverages(current: Date) -> InventoryManagable {
        return Inventory(inventory: self.inventory.filter { $0.isExpired(now: Date()) })
    }
    
    func hotBeverages() -> InventoryManagable {
        return Inventory(inventory: self.inventory.filter { $0.isHot(temparature: 60) })
    }
    
    func readInventores() -> [Beverage: Int] {
        var allInventores = [Beverage: Int]()
        
        self.inventory.forEach { beverage in
            allInventores[beverage, default: 0] += 1
        }
        
        return allInventores
    }
}
