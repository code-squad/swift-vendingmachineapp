//
//  InventoryBox.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/14.
//

import Foundation

class InventoryBox: NSObject, InventoryBoxManagable,NSCoding {
    
    private var inventoryBox: [ObjectIdentifier : [Beverage]]
    
    init(inventoryBox: [ObjectIdentifier : [Beverage]]) {
        self.inventoryBox = inventoryBox
    }
    
    convenience override init() {
        let inventoryBox = [ObjectIdentifier : [Beverage]]()
        self.init(inventoryBox: inventoryBox)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(separatedValues(), forKey: "inventoryBox")
    }
    
    required init?(coder: NSCoder) {
        let values = coder.decodeObject(forKey: "inventoryBox") as! [[Beverage]]
        var inventoryBox = [ObjectIdentifier : [Beverage]]()
        values.forEach { inventory in
            inventoryBox[ObjectIdentifier(type(of: inventory[0]))] = inventory
        }
        self.inventoryBox = inventoryBox
    }
    
    private func separatedValues() -> [[Beverage]] {
        var values = [[Beverage]]()
        
        self.inventoryBox.values.forEach { inventory in
            values.append(inventory)
        }
        
        return values
    }
    
    func readInventores(inventory: InventoryManagable) -> [ObjectIdentifier: [Beverage]] {
        var newInventoryBox = [ObjectIdentifier: [Beverage]]()
        
        inventory.forEachBeverage { beverage in
            let beverageType = ObjectIdentifier(type(of: beverage))
            newInventoryBox[beverageType, default: [Beverage]()].append(beverage)
        }
        
        self.inventoryBox = newInventoryBox
        return self.inventoryBox
    }
    
    func readInventoryCount(beverageType: Beverage.Type) -> Int {
        return self.inventoryBox[ObjectIdentifier(beverageType)]?.count ?? 0
    }
    
    func removeBeverage(beverageType: Beverage.Type) -> Beverage? {
        return self.inventoryBox[ObjectIdentifier(beverageType)]?.popLast()
    }
    
    func readBeveragePrice(beverageType: Beverage.Type) -> Int {
        return self.inventoryBox[ObjectIdentifier(beverageType)]?.first?.price ?? 0
    }
}
