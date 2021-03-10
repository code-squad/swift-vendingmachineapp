//
//  DrinkList.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/26.
//

import Foundation

class DrinksInventory {
    private var allTypes:[Drink.Type] = [StrawberryMilk.self, ChocoMilk.self, Sprite.self, CocaCola.self, Top.self, Cantata.self]
    private (set) var drinksInventory: Dictionary<ObjectIdentifier, [Drink]>
    
    init(){
        self.drinksInventory = [:]
        setting()
    }
    
    private func setting() {
        allTypes.forEach {
            drinksInventory[ObjectIdentifier($0)] = []
        }
    }
    
    func append(_ drink: Drink) {
        let drinkType = ObjectIdentifier(type(of: drink))
        drinksInventory[drinkType]?.append(drink)
    }
    
    func hasDrink(_ drink: Drink) ->  Bool {
        let drinkType = ObjectIdentifier(type(of: drink))
        if drinksInventory[drinkType]?.count == 0 {
            return false
        } else {
            return true
        }
    }
    
    func pop(_ drink: Drink) -> Drink? {
        let drinkType = ObjectIdentifier(type(of: drink))
        
        if drinksInventory[drinkType] != nil && hasDrink(drink) {
            return drinksInventory[drinkType]!.remove(at: 0)
        }
        
        return nil
    }
    
    func count() -> Int {
        drinksInventory.count
    }
    
    func drinkType(at index: Int) -> Drink.Type {
        return allTypes[index]
    }
    
    func drinkStock(at index: Int) -> Int {
        let drinkType = ObjectIdentifier(allTypes[index])
        return drinksInventory[drinkType]?.count ?? 0
    }
}
