//
//  Drink.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Drink {
    private var drinks : [Beverage : Int]
    private var stock : [Beverage]
    
    init() {
        self.drinks = [:]
        self.stock = []
    }
    
    func addStock(beverage : Beverage) {
        self.drinks[beverage] = (drinks[beverage] ?? 0) + 1
    }
    
    func showBeverageList(hanlder : (Beverage) -> Void) {
        drinks.forEach {
            hanlder($0.key)
        }
    }
    
    func purchasePossibleList(currentMoney : Int, handler : (Beverage) -> Void) {
        let drink = drinks.filter { $0.key.isPossible(money: currentMoney) }
        drink.forEach {
            handler($0.key)
        }
    }
    
    func purchaseBeverage(beverage : Beverage) {
        drinks[beverage] = (drinks[beverage] ?? 0) - 1
        stock.append(beverage)
    }
    
    func addStockPrice() {
        
    }
    
    func showAllBeverage(){
        
    }
    
}
