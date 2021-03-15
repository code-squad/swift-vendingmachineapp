//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/02.
//

import Foundation

class Inventory: NSObject, InventoryManagable, NSCoding {
    
    private var inventory: [Beverage]
    private let inventoryBox: InventoryBoxManagable

    init(inventory: [Beverage], inventoryBox: InventoryBoxManagable) {
        self.inventory = inventory
        self.inventoryBox = inventoryBox
    }
    
    convenience init(inventory: [Beverage]) {
        let inventoryBox = InventoryBox()
        self.init(inventory: inventory, inventoryBox: inventoryBox)
    }
    
    convenience override init() {
        let inventory: [Beverage] = []
        let inventoryBox = InventoryBox()
        self.init(inventory: inventory, inventoryBox: inventoryBox)
    }
    
    func encode(with coder: NSCoder) {}
    
    required init?(coder: NSCoder) {
        self.inventory = coder.decodeObject(forKey: "inventory") as? [Beverage] ?? []
        self.inventoryBox = coder.decodeObject(forKey: "inventoryBox") as! InventoryBox
    }
    
    func addBeverage(_ beverageType: Beverage.Type) {
        guard let beverage = BeverageFactory.produce(of: beverageType) else { return }
        self.inventory.append(beverage)
        _ = readInventores()
    }
    
    func isPurchasableInventory(balance: Int) -> InventoryManagable {
        return Inventory(inventory: self.inventory.filter { $0.isPurchasable(balance: balance) })
    }
    
    func forEachBeverage(handler: (Beverage) -> ()) {
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
    
    func readInventoryCount(beverageType: Beverage.Type) -> Int {
        return self.inventoryBox.readInventoryCount(beverageType: beverageType)
    }
    
    func readInventores() -> [ObjectIdentifier : [Beverage]] {
        return self.inventoryBox.readInventores(inventory: Inventory(inventory: self.inventory))
    }
    
    func removeBeverageInInventoryBox(beverageType: Beverage.Type) -> Beverage? {
        self.removeBeverage(beverageType: beverageType)
        return self.inventoryBox.removeBeverage(beverageType: beverageType)
    }
    
    func mappingIndexToBeverageType(by index: Int) -> Beverage.Type? {
        return self.inventoryBox.mappingIndexToBeverageType(by: index)
    }
    
    func mappingIndexToMoneyInput(by index: Int) -> Money.Input? {
        return self.inventoryBox.mappingIndexToMoneyInput(by: index)
    }
    
    private func removeBeverage(beverageType: Beverage.Type) {
        var toRemoveBeverage: Beverage!
        self.inventory.forEach { beverage in
            let toRemoveBeverateType = type(of: beverage)
            if toRemoveBeverateType == beverageType {
                toRemoveBeverage = beverage
            }
        }
        self.inventory.remove(at: self.inventory.firstIndex(of: toRemoveBeverage)!)
    }
}
