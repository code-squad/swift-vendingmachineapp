//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Drinks {
    private var dinks: [Drinkable]
    
    init(drinks: [Drinkable]) {
        self.dinks = drinks
    }
    
    func retrieveDrinks(completion: (Drinkable) -> Void) {
        dinks.forEach { drink in
            completion(drink)
        }
    }
}
