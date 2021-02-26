//
//  DrinkStock.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/26.
//

import Foundation


class DrinkStock {
    
    private var drinks: [Drink]
    
    init() {
        self.drinks = []
    }
    
    
    func addDrink(what newItem: Drink){
        self.drinks.append(newItem)
    }
    
    func removeDrink(at item: Drink){
        
    }
    
    func getHotDrink() {
        
    }
    
    func countDrinkStock() -> Int {
        return drinks.count
    }
}
