//
//  Drink.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Drink {
    private var drinks : [Beverage]
    
    init() {
        self.drinks = []
    }
    
    func addStock(beverage : Beverage) {
        self.drinks.append(beverage)
    }
    
    func showBeverageList(hanlder : (Beverage) -> Void) {
        drinks.forEach {
            hanlder($0)
        }
    }
    
    func purchasePossibleList(currentMoney : Int, handler : (Beverage) -> Void) {
        let drink = drinks.filter { $0.isPossible(money: currentMoney) }
        drink.forEach {
            handler($0)
        }
    }
    
}
