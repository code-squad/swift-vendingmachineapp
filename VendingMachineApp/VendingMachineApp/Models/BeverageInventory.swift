//
//  DrinkList.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/26.
//

import Foundation

class BeverageInventory {
    private var allTypes:[Beverage.Type] = [StrawberryMilk.self, ChocoMilk.self, Sprite.self, CocaCola.self, Top.self, Cantata.self]
    private (set) var beverageInventory: Dictionary<ObjectIdentifier, [Beverage]>
    
    init(){
        self.beverageInventory = [:]
        setting()
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
    
    func hasDrink(with drink: Beverage) ->  Bool {
        let drinkType = ObjectIdentifier(type(of: drink))
        if beverageInventory[drinkType]?.count == 0 {
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
        
        if beverageInventory[drinkType] != nil && hasDrink(with: drink) {
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
    
    func validateBeverage(when date: Date) -> [Beverage] {
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
