//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by delma on 29/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
struct VendingMachine {
    private var beverages: Beverages
//    private var money: [String:Int] = ["fiveThousand" : 0, "thousand" : 0, "fiveHundred" : 0, "hundred" : 0]
    private(set) var balance = 0
    private var purchasedList: [Beverage] = []
    private var money: Money
    init() {
        beverages = Beverages()
        money = Money()
    }
    
    func showTotalStock() {
        beverages.forEachBeverages { print($0.description) }
    }
    
    mutating func raiseMoney(fiveThousandCount: Int, thousandCount: Int, fiveHundredCount: Int, hundredCount: Int) {
        money.raiseMoney(fiveThousandCount: fiveThousandCount, thousandCount: thousandCount, fiveHundredCount: fiveHundredCount, hundredCount: hundredCount)
    }

    func addStock(_ beverage: Beverage) {
        beverages.addBeverage(beverage)
    }

    mutating func reportAvailableBeverageNowMoney() -> [Beverage] {
        var purchasbleBeverages: [Beverage] = []
        beverages.forEachBeverages { (beverage) in
            if beverage.price > balance {
                purchasbleBeverages.append(beverage)
            }
        }
        return purchasbleBeverages
    }

    mutating func purchaseBeverage(beverage: Beverage, price: Int) {
        balance = money.confirmBalance(balance)
        balance -= price
        beverages.removeBeverage(beverage)
        purchasedList.append(beverage)
    }

    mutating func confirmBalance(balance: Int) -> Int {
        return balance + money.confirmBalance(balance)
    }
    
    func reportTotalStock() -> [Beverage:Int] {
        return beverages.reportKindWithCount()
    }
    
    func reportExpiratedBeverage() -> [Beverage] {
        return beverages.reportExpiratedBeverage()
    }

    func verifyHotBeverages() -> [Beverage] {
       return beverages.verifyHotBeverages()
    }
    
    func reportPurchasedHistory() -> [Beverage] {
        return purchasedList
    }
}
