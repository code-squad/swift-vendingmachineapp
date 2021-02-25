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
        drinks.append(beverage)
    }
    
    func showBeverageList(hanlder : (Beverage) -> Void) {
        drinks.forEach {
            hanlder($0)
        }
    }
    
    func purchasePossibleList(currentMoney : Int) -> [Beverage] {
        return drinks.filter { $0.isPossible(money: currentMoney) }
    }
    
    func purchaseBeverage(beverage : Beverage) {
        let _ = drinks.firstIndex(of: beverage).map { drinks.remove(at: $0) }
    }
    
    func showAllBeverage() -> [Beverage : Int] {
       return drinks.reduce(into: [:]) { goods, beverage in
            goods[beverage, default: 0] += 1
        }
    }
    
    func passExpiryDate() -> [Beverage] {
        return drinks.filter { $0.validate(with: Date()) }
    }
    
    func hotDrink() -> [Beverage] {
        drinks.filter { $0.isHot() }
    }
}
