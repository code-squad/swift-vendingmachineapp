//
//  InventoryBox.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/14.
//

import Foundation

class InventoryBox: NSObject, InventoryBoxManagable,NSCoding {
    
    private var inventoryBox: [ObjectIdentifier : [Beverage]]
    private let beverageMapper: BeverageMapperable
    private let moneyMapper: MoneyMapperable
    
    init(inventoryBox: [ObjectIdentifier : [Beverage]], beverageMapper: BeverageMapperable, moneyMapper: MoneyMapperable) {
        self.beverageMapper = beverageMapper
        self.moneyMapper = moneyMapper
        self.inventoryBox = inventoryBox
    }
    
    convenience init(inventoryBox: [ObjectIdentifier : [Beverage]]) {
        let beverageMapper = BeverageMapper(beverageTypes: [Banana.self, Strawberry.self,
                                                    TOP.self, Cantata.self,
                                                    Cola.self, Cider.self
                                                    ])
        let moneyMapper = MoneyMapper(moneyInputTypes: [Money.Input.oneThousand, Money.Input.fiveThousand])
        self.init(inventoryBox: inventoryBox, beverageMapper: beverageMapper, moneyMapper: moneyMapper)
    }
    
    convenience override init() {
        let inventoryBox = [ObjectIdentifier : [Beverage]]()
        let beverageMapper = BeverageMapper(beverageTypes: [Banana.self, Strawberry.self,
                                                    TOP.self, Cantata.self,
                                                    Cola.self, Cider.self
                                                    ])
        let moneyMapper = MoneyMapper(moneyInputTypes: [Money.Input.oneThousand, Money.Input.fiveThousand])
        self.init(inventoryBox: inventoryBox, beverageMapper: beverageMapper, moneyMapper: moneyMapper)
    }
    
    func encode(with coder: NSCoder) {
        
    }
    
    required init?(coder: NSCoder) {
        self.inventoryBox = coder.decodeObject(forKey: "inventoryBox") as! [ObjectIdentifier : [Beverage]]
        self.beverageMapper = coder.decodeObject(forKey: "beverageMapper") as! BeverageMapper
        self.moneyMapper = coder.decodeObject(forKey: "moneyMapper") as! MoneyMapper
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
    
    func mappingIndexToBeverageType(by index: Int) -> Beverage.Type? {
        return self.beverageMapper.mapping(by: index)
    }
    
    func mappingIndexToMoneyInput(by index: Int) -> Money.Input? {
        return self.moneyMapper.mapping(by: index)
    }
}
