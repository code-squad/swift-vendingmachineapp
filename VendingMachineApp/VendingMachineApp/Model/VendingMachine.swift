//
//  VendinMachine.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class VendingMachine {
    private var drinks: Drinks
    
    init(drinks: Drinks = Drinks()) {
        self.drinks = drinks
    }
    
    func add(beverage: Beverage) {
        drinks.add(with: beverage)
    }
    
    func printDrinks(completion: (Beverage)->Void) {
        drinks.printDrinks(completion: completion)
    }
}
