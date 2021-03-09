//
//  Cashier.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/03/08.
//

import Foundation

class Cashier {
    private(set) var moneyDeposited: Int
    
    init() {
        moneyDeposited = 0
    }
    
    func insert(money: Int) {
        moneyDeposited += money
    }
    
    func getPurchasableBeverages(with stock: Stock) -> [Beverage] {
        return stock.purchasableBeverages(with: moneyDeposited)
    }
    
    func purchase(beverage: Beverage, stock: Stock) -> Beverage {
        moneyDeposited -= beverage.price
        return stock.remove(beverage: beverage)
    }
}
