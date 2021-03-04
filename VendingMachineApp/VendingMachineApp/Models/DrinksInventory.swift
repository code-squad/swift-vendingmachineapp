//
//  DrinkList.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/26.
//

import Foundation

class DrinksInventory {
    private (set) var drinksInventory: Dictionary<ObjectIdentifier, Int>
    
    init(){
        drinksInventory = [:]
    }
    
    func append(_ drink: Drink) {
        let obj = ObjectIdentifier(type(of: drink))
        if drinksInventory[obj] != nil {
            drinksInventory[obj]? += 1
        } else {
            drinksInventory[obj] = 1
            return
        }
    }
    
    func hasDrink(_ drink: Drink) ->  Bool {
        let obj = ObjectIdentifier(type(of: drink))
        if let _ = drinksInventory[obj] {
            return true
        } else {
            return false
        }
    }
    
    func pop(_ drink: Drink) {
        let obj = ObjectIdentifier(type(of: drink))
        if let stock = drinksInventory[obj] {
            drinksInventory[obj]? -= 1
            checkZero(stock, drink)
        } else {
            drinksInventory[obj] = 1
            return
        }
    }
    
    private func checkZero(_ stock:Int, _ drink: Drink) {
        if stock == 0 {
            let obj = ObjectIdentifier(type(of: drink))
            drinksInventory.removeValue(forKey: obj)
        }
    }
}
