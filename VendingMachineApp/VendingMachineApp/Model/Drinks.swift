//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Drinks {
    private var drinks: [Beverage]
    
    init() {
        self.drinks = []
    }
    
    func add(with beverage: Beverage) {
        drinks.append(beverage)
    }
    
    func retrieveBeverage(completion: (Beverage)->Void) {
        drinks.forEach { (beverage) in
            completion(beverage)
        }
    }
}
