//
//  File.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class Drinks {
    private var drinks : [Drink]
    
    init() {
        self.drinks = []
    }
    
    func addDrink(what product : Drink) {
        drinks.append(product)
    }
    
    func doClosure(closure : (([Drink]) -> Void)) {
        closure(drinks)
    }
    
    /// if fail -> return false.
    func remove(at product : Drink) -> Bool {
        guard let removeTarget = drinks.firstIndex(where: {
            $0.isSameName(with: product)
        })
        else {
            return false
        }
        drinks.remove(at: removeTarget)
        
        return true
    }
}
