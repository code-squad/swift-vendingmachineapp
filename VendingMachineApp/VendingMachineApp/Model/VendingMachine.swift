//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class VendingMachine {
    private let drinks: [Beverage]
    
    init(drinks: [Beverage]) {
        self.drinks = drinks
    }
    
    func printDrinks() {
        drinks.forEach { drink in
            print(drink)
        }
    }
}
