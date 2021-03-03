//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/02.
//

import Foundation

typealias InventoryWithCount = [Beverage: Int]

class Inventory: InventoryManagable {

    private var inventory: [Beverage]
    private (set) var count: Int
    
    init(inventory: [Beverage]) {
        self.inventory = inventory
        self.count = 0
    }
    
    convenience init() {
        let inventory: [Beverage] = []
        self.init(inventory: inventory)
    }
    
    private func updateCount() {
        self.count = inventory.count
    }
    
    func addInventory(_ beverage: Beverage) {
        self.inventory.append(beverage)
        self.updateCount()
    }
    
    func isPurchasableInventory(balance: Int) -> Inventory {
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
    
    func expiredBeverages(current: Date) -> Inventory {
        return Inventory(inventory: self.inventory.filter { $0.validate(with: Date()) })
    }
    
    func hotBeverages() -> Inventory {
        return Inventory(inventory: self.inventory.filter { $0.isHot() })
    }
    
    func readInventores() -> InventoryWithCount {
        var allInventores = InventoryWithCount()
        
        self.inventory.forEach { beverage in
            allInventores[beverage, default: 0] += 1
        }
        
        return allInventores
    }
}
