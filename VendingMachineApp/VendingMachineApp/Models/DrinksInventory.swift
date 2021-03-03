//
//  DrinkList.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/26.
//

import Foundation

class DrinksInventory {
    private (set) var drinkInventory: Dictionary<Drink, Int>
    
    init(){
        drinkInventory = [:]
    }
    
    func append(_ drink: Drink) {
        guard var stock = drinkInventory[drink] else {
            drinkInventory[drink] = 1
            return
        }
        stock += 1
    }
    
    func hasDrink(_ drink: Drink) ->  Bool {
        if let _ = drinkInventory[drink] {
            return true
        } else {
            return false
        }
    }
    
    func pop(_ drink: Drink) {
        guard var stock = drinkInventory[drink] else {
            return
        }
        stock -= 1
        checkZero(stock, drink)
    }
    
    private func checkZero(_ stock:Int, _ drink: Drink) {
        if stock == 0 {
            drinkInventory.removeValue(forKey: drink)
        }
    }
    
    
}
