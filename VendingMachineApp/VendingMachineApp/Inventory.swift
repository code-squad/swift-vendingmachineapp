//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/02.
//

import Foundation

class Inventory: NSObject, InventoryManagable, NSCoding {
    
    private var inventory: [Beverage]
    private let mapper: BeverageMapperable
    
    init(inventory: [Beverage], mapper: BeverageMapperable) {
        self.mapper = mapper
        self.inventory = inventory
    }
    
    convenience init(inventory: [Beverage]) {
        let mapper = BeverageMapper()
        self.init(inventory: inventory, mapper: mapper)
    }
    
    convenience override init() {
        let inventory: [Beverage] = []
        let mapper = BeverageMapper()
        self.init(inventory: inventory, mapper: mapper)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.inventory, forKey: "inventory")
        coder.encode(self.mapper, forKey: "mapper")
    }
    
    required init?(coder: NSCoder) {
        self.inventory = coder.decodeObject(forKey: "inventory") as? [Beverage] ?? []
        self.mapper = coder.decodeObject(forKey: "mapper") as? BeverageMapper ?? BeverageMapper()
    }
    
    func addBeverage(_ beverage: Beverage) {
        self.inventory.append(beverage)
        NotificationCenter.default.post(name: .didChangeInventory, object: nil)
    }
    
    func isPurchasableInventory(balance: Int) -> InventoryManagable {
        return Inventory(inventory: self.inventory.filter { $0.isPurchasable(balance: balance) })
    }
    
    func removeBeverage(_ beverage: Beverage) -> Beverage? {
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
    
    func readInventoryCount(index: Int, allInventores: [ObjectIdentifier: [Beverage]]) -> Int {
        guard let beverageType = self.mapper.mapping(by: index) else { return 0 }
        return allInventores[ObjectIdentifier(beverageType)]?.count ?? 0
    }
    
    func tagToBeverageType(by tag: Int) -> Beverage.Type? {
        return self.mapper.mapping(by: tag)
    }
}

extension Notification.Name {
    static let didChangeInventory = Notification.Name("didChangeInventory")
}
