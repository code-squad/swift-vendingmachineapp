//
//  File.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class Drinks {
    
    enum errorCase : Error {
        case outOfIndex
    }
    
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
    func remove(at productType : Drink.Type) throws -> Drink {
        guard let removeTarget = drinks.firstIndex(where: {
            $0.isSameType(with: productType)
        })
        else {
            throw errorCase.outOfIndex
        }
        return drinks.remove(at: removeTarget)
        
        
    }
}
