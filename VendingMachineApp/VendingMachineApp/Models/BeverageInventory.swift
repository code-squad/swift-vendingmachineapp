//
//  DrinkList.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/26.
//

import Foundation

typealias Inventory = Dictionary<ObjectIdentifier, [Beverage]>

class BeverageInventory: NSObject, NSCoding {
    
    private var allTypes:[Beverage.Type] = [StrawberryMilk.self, ChocoMilk.self, Sprite.self, CocaCola.self, Top.self, Cantata.self]
    private (set) var beverageInventory: Inventory
    
    override init(){
        self.beverageInventory = [:]
        super.init()
        setting()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(allTypes, forKey: "allTypes")
        coder.encode(allBeverages(), forKey: "allBeverages")
    }
    
    required init?(coder: NSCoder) {
        self.allTypes = coder.decodeObject(forKey: "allTypes") as! [Beverage.Type]
        let allBeverages = coder.decodeObject(forKey: "allBeverages") as! [[Beverage]]
        var beverageInventory = Inventory()
        
        allTypes.forEach {
            beverageInventory[ObjectIdentifier($0)] = []
        }
        
        allBeverages.forEach {
            beverageInventory[ObjectIdentifier(type(of: $0[0]))]? = $0
        }
        self.beverageInventory = beverageInventory
        
    }
    
    private func setting() {
        allTypes.forEach {
            beverageInventory[ObjectIdentifier($0)] = []
        }
    }
    
    func append(_ beverage: Beverage) {
        let drinkType = ObjectIdentifier(type(of: beverage))
        beverageInventory[drinkType]?.append(beverage)
    }
    
    func append(_ beverages: [Beverage]) {
        beverages.forEach { beverage in
            let drinkType = ObjectIdentifier(type(of: beverage))
            beverageInventory[drinkType]?.append(beverage)
        }
    }
    
    func hasBeverage(with beverage: Beverage) ->  Bool {
        let beverageType = ObjectIdentifier(type(of: beverage))
        if beverageInventory[beverageType]?.count == 0 {
            return false
        } else {
            return true
        }
    }
    
    func show(handler: (Beverage) -> Void) {
        beverageInventory.values.forEach {
            $0.forEach {
                handler($0)
            }
        }
    }
    
    func pop(_ drink: Beverage) -> Beverage? {
        let drinkType = ObjectIdentifier(type(of: drink))
        
        if beverageInventory[drinkType] != nil && hasBeverage(with: drink) {
            return beverageInventory[drinkType]!.remove(at: 0)
        }
        return nil
    }
    
    func count() -> Int {
        beverageInventory.count
    }
    
    func countType() -> Int {
        return allTypes.count
    }
    
    func beverageType(at index: Int) -> Beverage.Type {
        return allTypes[index]
    }
    
    func countBeverage(at index: Int) -> Int {
        let beverageType = ObjectIdentifier(allTypes[index])
        return beverageInventory[beverageType]?.count ?? 0
    }
    
    func allBeverages() -> [[Beverage]] {
        var beverages: [[Beverage]] = []
        beverageInventory.values.forEach {
            beverages.append($0)
        }
        return beverages
    }
    
    func possibleBeverages(with credit: Money) -> [Beverage]{
        var beverages:[Beverage] = []
        beverageInventory.values.forEach {
            $0.forEach {
                if $0.canBuy(with: credit) {
                    beverages.append($0)
                }
            }
        }
        return beverages
    }
    
    func hotBeverages() -> [Beverage] {
        var beverages: [Beverage] = []
        beverageInventory.values.forEach {
            $0.forEach {
                if $0.isHot() {
                    beverages.append($0)
                }
            }
        }
        return beverages
    }
    
    func lowCalorieBeverages() -> [Beverage] {
        var beverages: [Beverage] = []
        beverageInventory.values.forEach {
            $0.forEach {
                if $0.isLowCalore() {
                    beverages.append($0)
                }
            }
        }
        return beverages
    }
    
    func validateBeverages(when date: Date) -> [Beverage] {
        var beverages: [Beverage] = []
        beverageInventory.values.forEach {
            $0.forEach {
                if $0.validate(date: date) {
                    beverages.append($0)
                }
            }
        }
        return beverages
    }
}
