//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/02.
//

import Foundation

class Inventory: InventoryManagable {
    
    private var inventory: [Beverage]
    private let mapper: BeverageMapper
    private (set) var beverageCounts: [Int: Beverage.Type]
    
    init(inventory: [Beverage]) {
        self.mapper = BeverageMapper()
        self.inventory = inventory
        self.beverageCounts = [Int: Beverage.Type]()
    }
    
    convenience init() {
        let inventory: [Beverage] = []
        self.init(inventory: inventory)
    }
    
    func addInventory(_ beverage: Beverage) {
        self.inventory.append(beverage)
        NotificationCenter.default.post(name: .didChangeInventory, object: nil)
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
    
    func readInventores() -> [ObjectIdentifier: [Beverage]] {
        var allInventores = [ObjectIdentifier: [Beverage]]()
        
        self.inventory.forEach { beverage in
            let beverageType = ObjectIdentifier(type(of: beverage))
            allInventores[beverageType, default: [Beverage]()].append(beverage)
        }
        
        return allInventores
    }
    
    func readInventory(index: Int, allInventores: [ObjectIdentifier: [Beverage]]) -> Int {
        guard let beverageType = self.mapper.mapping(by: index) else { return 0 }
        return allInventores[ObjectIdentifier(beverageType)]?.count ?? 0
    }
    
    func tagToBeverageType(by tag: Int) -> Beverage.Type? {
        return self.mapper.mapping(by: tag)
    }
}
