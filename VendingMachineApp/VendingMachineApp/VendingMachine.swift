//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

class VendingMachine {
    
    private var drinks: [Drink]
    
    init(drinks: [Drink]) {
        self.drinks = drinks
    }
    
    func showVendingMachine(handler: (Drink) -> ()) {
        drinks.forEach {
            handler($0)
        }
    }
}
