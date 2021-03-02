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
    func remove(with beverage: Beverage) {
        if let beverageIndex = drinks.firstIndex(of: beverage) {
            drinks.remove(at: beverageIndex)
        }
    }
    
    func retrieveBeverage(completion: (Beverage)->Void) {
        drinks.forEach { (beverage) in
            completion(beverage)
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
        drinks.filter { (beverage) in
            return beverage.isExpired()
        }
    }
}
