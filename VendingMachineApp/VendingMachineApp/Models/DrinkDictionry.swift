//
//  DrinkList.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/26.
//

import Foundation

class DrinksDictionary {
    private (set) var drinkDictionary: Dictionary<Drink, Int>
    
    init(){
        drinkDictionary = [:]
    }
    
    func append(_ drink: Drink) {
        guard var stock = drinkDictionary[drink] else {
            drinkDictionary[drink] = 1
            return
        }
        stock += 1
    }
    
    func hasDrink(_ drink: Drink) ->  Bool {
        if let _ = drinkDictionary[drink] {
            return true
        } else {
            return false
        }
    }
    
    func pop(_ drink: Drink) {
        guard var stock = drinkDictionary[drink] else {
            return
        }
        stock -= 1
        checkZero(stock, drink)
    }
    
    func checkZero(_ stock:Int, _ drink: Drink) {
        if stock == 0 {
            drinkDictionary.removeValue(forKey: drink)
        }
    }
    
    
}
