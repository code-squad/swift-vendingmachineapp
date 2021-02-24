//
//  VendinMachine.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class VendingMachine {
    private var drinks: [Beverage]
    
    init() {
        drinks = []
    }
    
    func add(with beverage: Beverage) {
        self.drinks.append(beverage)
    }
    
    func printDrinks() {
        drinks.forEach { (beverage) in
            print(beverage)
        }
    }
}
