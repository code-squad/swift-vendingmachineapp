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
    private var money = 0
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
    
    func checkBalance() -> Int {
        return money
    }
    
    mutating func putMoney(_ money: Int) {
        self.money += money
    }
    
    mutating func buy(beverageName: String) -> Beverage? {
        guard purchasableList.contains(where: { $0.name == beverageName }) else {
            return nil
        }
        let beverage = stock.serve(beverageName: beverageName)
        money -= beverage.price
        purchaseHistory.append(beverage)
        return beverage
    }
}
