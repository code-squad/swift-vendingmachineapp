//
//  Drink.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Drink {
    private var drinks : [Beverage]
    private var purchasedList : [Beverage]
    
    init() {
        self.drinks = []
        self.purchasedList = []
    }
    
    func addStock(beverage : Beverage) {
        drinks.append(beverage)
    }
    
    func showBeverageList(hanlder : (Beverage) -> Void) {
        drinks.forEach {
            hanlder($0)
        }
    }
    
    func purchasePossibleList(currentMoney : Int, handler : ([Beverage]) -> Void) {
        handler(drinks.filter { $0.isPossible(money: currentMoney) })
    }
    
    func purchaseBeverage(beverage : Beverage) {
        let _ = drinks.firstIndex(of: beverage).map { drinks.remove(at: $0) }
        purchasedList.append(beverage)
    }
    
    func addStockPrice() -> Int {
        return purchasedList.reduce(0) { $1.price }
    }
    
    func showAllBeverage(handler : ([Beverage : Int]) -> Void) {
        let stockList = drinks.reduce(into: [:]) { goods, beverage in
            goods[beverage, default: 0] += 1
        }
        handler(stockList)
    }
    
    func passExpiryDate(expiryDate : Date, handler : ([Beverage]) -> Void) {
        handler(drinks.filter { $0.validate(with: expiryDate) })
    }
    
    func hotDrink(expiryDate : Date, handler : ([Beverage]) -> Void) {
        handler(drinks.filter { $0.isHot() })
    }
    
    func purchaseHistory() -> [Beverage] {
        return purchasedList
    }
}
