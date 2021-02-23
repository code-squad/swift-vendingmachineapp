//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Drinks {
    private var drinks: [Drink]
    
    init(drinks: [Drink]) {
        self.drinks = drinks
    }
    
    func retrieveDrinks(completion: (Drink) -> Void) {
        drinks.forEach { drink in
            completion(drink)
        }
    }
}
