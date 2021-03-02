//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Drinks {
    private var drinks: [Beverage]
    private var purchasedDrinks: [Beverage]
    
    init() {
        self.drinks = []
        self.purchasedDrinks = []
    }
    
    func add(with beverage: Beverage) {
        drinks.append(beverage)
    }
    func remove(with beverage: Beverage) {
        if let beverageIndex = drinks.firstIndex(of: beverage) {
            purchasedDrinks.append(drinks.remove(at: beverageIndex))
        }
    }

    func showListForPurchase(with cash: Int) -> [Beverage]{
        return drinks.filter { (beverage) in
            return beverage.isAvailablePurchase(with: cash)
        }
    }
    func giveStockList() -> [Beverage:Int] {
        var result = [Beverage:Int]()
        drinks.forEach { (beverage) in
            if result[beverage] == nil {
                result[beverage] = 1
            } else {
                result[beverage]! += 1
            }
        }
        return result
    }
    func giveExpiredList() -> [Beverage] {
        return drinks.filter{$0.isExpired(on: Date())}
    }
    func giveHotBeverageList() -> [Beverage] {
        return drinks.filter{$0.isHot(at: 65)}
    }
    func givePurchasedList() -> [Beverage] {
        return self.purchasedDrinks
    }
}
