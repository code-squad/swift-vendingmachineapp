//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

struct VendingMachine {
    private var stock = Stock()
    private var money = Money()
    private(set) var purchaseHistory = [Beverage]()
    var purchasableList: [Beverage] {
        stock.getPurchasableList(money: money)
    }
    var stockList: [Beverage: Int] {
        stock.sortOut()
    }
    var dateExpiredBeverages: [Beverage] {
        stock.getDateExpiredBeverages()
    }
    var hotBeverages: [Beverage] {
        stock.getHotBeverages()
    }
    
    func addBeverage(beverage: Beverage) {
        stock.add(beverage: beverage)
    }
    
    func checkBalance() -> Money {
        return money
    }
    
    mutating func addBalance(_ money: Money) {
        self.money += money
    }
    
    mutating func buy(beverage: Beverage) -> Beverage? {
        guard purchasableList.contains(beverage) else {
            return nil
        }
        let servedBeverage = stock.serve(beverage: beverage)
        money -= servedBeverage.price
        purchaseHistory.append(servedBeverage)
        return beverage
    }
}
