//
//  VendinMachine.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class VendingMachine {
    private var drinks: Drinks
    private var cashManagementSystem: CashManagementSystem
    init() {
        self.drinks = Drinks()
        self.cashManagementSystem = CashManagementSystem()
    }
    
    func add(beverage: Beverage) {
        drinks.add(with: beverage)
    }
    
    func retreiveDrinks(completion: (Beverage)->Void) {
        drinks.retrieveBeverage(completion: completion)
    }
    
}
