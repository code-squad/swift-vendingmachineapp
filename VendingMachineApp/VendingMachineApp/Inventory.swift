//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/02.
//

import Foundation

class Inventory: NSObject, InventoryManagable, NSCoding {
    
    private var inventory: [Beverage]
    private let beverageMapper: BeverageMapperable
    private let moneyMapper: MoneyMapperable
    
    init(inventory: [Beverage], beverageMapper: BeverageMapperable, moneyMapper: MoneyMapperable) {
        self.beverageMapper = beverageMapper
        self.moneyMapper = moneyMapper
        self.inventory = inventory
    }
    
    convenience init(inventory: [Beverage]) {
        let beverageMapper = BeverageMapper(beverageTypes: [Banana.self, Strawberry.self,
                                                    TOP.self, Cantata.self,
                                                    Cola.self, Cider.self
                                                    ])
        let moneyMapper = MoneyMapper(moneyInputTypes: [Money.Input.oneThousand, Money.Input.fiveThousand])
        self.init(inventory: inventory, beverageMapper: beverageMapper, moneyMapper: moneyMapper)
    }
    
    convenience override init() {
        let inventory: [Beverage] = []
        let beverageMapper = BeverageMapper(beverageTypes: [Banana.self, Strawberry.self,
                                                    TOP.self, Cantata.self,
                                                    Cola.self, Cider.self
                                                    ])
        let moneyMapper = MoneyMapper(moneyInputTypes: [Money.Input.oneThousand, Money.Input.fiveThousand])
        self.init(inventory: inventory, beverageMapper: beverageMapper, moneyMapper: moneyMapper)
    }
    
    func encode(with coder: NSCoder) {}
    
    required init?(coder: NSCoder) {
        self.inventory = coder.decodeObject(forKey: "inventory") as? [Beverage] ?? []
        self.beverageMapper = coder.decodeObject(forKey: "beverageMapper") as! BeverageMapper
        self.moneyMapper = coder.decodeObject(forKey: "moneyMapper") as! MoneyMapper
    }
    
    func addBeverage(_ beverage: Beverage) {
        self.inventory.append(beverage)
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
        guard let beverageType = self.beverageMapper.mapping(by: index) else { return 0 }
        return allInventores[ObjectIdentifier(beverageType)]?.count ?? 0
    }
    
    func tagToBeverageType(by tag: Int) -> Beverage.Type? {
        return self.beverageMapper.mapping(by: tag)
    }
    
    func tagToMoneyInputType(by tag: Int) -> Money.Input? {
        return self.moneyMapper.mapping(by: tag)
    }
}
