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
        
        return beverages.reportAvailableBeverageNowMoney(confirmBalance(balance: balance))
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
