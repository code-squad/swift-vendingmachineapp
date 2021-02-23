//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class VendingMachine {
    private var drinks: Drinks
    
    init(drinks: Drinks) {
        self.drinks = drinks
    }
    
    func retrieveDrinks(completion: (Drinkable) -> Void) {
        drinks.retrieveDrinks(completion: completion)
    }
}
