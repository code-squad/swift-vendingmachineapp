//
//  DrinkList.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/26.
//

import Foundation

class DrinksInventory {
    private (set) var drinksInventory: Dictionary<String, Int>
    init(){
        drinksInventory = [:]
    }
    
    func append(_ drink: Drink) {
        let drinkType = String(describing: type(of: drink))
        if drinksInventory[drinkType] != nil {
            drinksInventory[drinkType]? += 1
        } else {
            drinksInventory[drinkType] = 1
            return
        }
    }
    
    func hasDrink(_ drink: Drink) ->  Bool {
        let drinkType = String(describing: type(of: drink))
        if let _ = drinksInventory[drinkType] {
            return true
        } else {
            return false
        }
    }
    
    func pop(_ drink: Drink) {
        let drinkType = String(describing: type(of: drink))
        if let stock = drinksInventory[drinkType] {
            drinksInventory[drinkType]? -= 1
            checkZero(stock, drink)
        } else {
            drinksInventory[drinkType] = 1
            return
        }
    }
    
    private func checkZero(_ stock:Int, _ drink: Drink) {
        if stock == 0 {
            let drinkType = String(describing: type(of: drink))
            drinksInventory.removeValue(forKey: drinkType)
        }
    }
}
