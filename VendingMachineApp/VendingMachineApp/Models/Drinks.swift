//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/25.
//

import Foundation

class Drinks {
    
    private var drinks: [Drink]
    
    init() {
        self.drinks = []
    }
    
    init(_ drinks: [Drink]) {
        self.drinks = drinks
    }
    
    func show(handler: (Drink) -> Void) {
        drinks.forEach {
            handler($0)
        }
    }
    
    func append(_ drink: Drink) {
        drinks.append(drink)
    }
    
    func append(_ newDrinks: [Drink]) {
        newDrinks.forEach {
            drinks.append($0)
        }
    }
    
    func possibleDrinks(with credit: Int) -> Drinks {
        return Drinks(drinks.filter {
            $0.canBuy(with: credit)
        })
    }
    
    func validateDrinks(when date: Date) -> Drinks {
        return Drinks(drinks.filter {
            $0.validate(date: date)
        })
    }
    
    func hotDrinks() -> Drinks {
        return Drinks(drinks.filter {
            $0.isHot()
        })
    }
    
    func lowCalorieDrinks() -> Drinks {
        return Drinks(drinks.filter {
            $0.isLowCalore()
        })
    }
}
