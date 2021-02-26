//
//  Drink.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Drinks {
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
    
    func purchasePossibleList(money : Int) -> [Beverage] {
        return drinks.filter { $0.isPossiblePurchase(money: money) }
    }
    
    func purchase(beverage : Beverage) {
        guard let index = drinks.firstIndex(of: beverage) else { return }
        drinks.remove(at: index)
    }
    
    func showAllBeverage() -> [Beverage : Int] {
       return drinks.reduce(into: [:]) { goods, beverage in
            goods[beverage, default: 0] += 1
        }
    }
    
    func passExpiryDate(standard : Date) -> [Beverage] {
        return drinks.filter { $0.validate(with: standard) }
    }
    
    func hotDrink() -> [Beverage] {
        return drinks.filter { $0.isHot(standard : 65) }
    }
}
