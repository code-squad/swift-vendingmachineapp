//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Drinks {
    private var drinks: [Beverage]
    
    init(_ drinks: [Beverage]) {
        self.drinks = drinks
    }
    convenience init() {
        self.init([])
    }
    
    func add(with beverage: Beverage) {
        drinks.append(beverage)
    }
    
    func remove(with beverage: Beverage) -> Beverage {
        let beverageIndex = drinks.firstIndex(of: beverage) ?? -1
        return drinks.remove(at: beverageIndex)
    }

    func showListForPurchase(with cashManagementSystem: CashManagementSystem) -> Drinks {
        return cashManagementSystem.retrieveCash { (cash) in
            return Drinks(drinks.filter{$0.isAvailablePurchase(with: cash)})
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
    
    func giveExpiredList() -> Drinks {
        return Drinks(drinks.filter{$0.isExpired(on: Date())})
    }
    
    func giveHotBeverageList() -> Drinks {
        return Drinks(drinks.filter{$0.isHot(at: 65)})
    }
}

extension Drinks: Equatable {
    static func == (lhs: Drinks, rhs: Drinks) -> Bool {
        return lhs.drinks == rhs.drinks
    }
}
