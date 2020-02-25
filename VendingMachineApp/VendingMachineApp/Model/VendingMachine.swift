//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

struct VendingMachine {
    var stock = Stock()
    var money = 0
    var purchasableList: [Beverage] {
        return stock.getPurchasableList(money: money)
    }
    
    func addBeverage(beverage: Beverage) {
        stock.add(beverage: beverage)
    }
    
    func printStock() {
        stock.printAll()
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
        return beverage
    }
}
