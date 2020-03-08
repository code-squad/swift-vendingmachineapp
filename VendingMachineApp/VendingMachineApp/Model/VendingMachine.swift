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
    private(set) var balance: Money = Money()
    private var purchasedList: [Beverage] = []

    init() {
        beverages = Beverages()
    }
    
    func showTotalStock() {
        beverages.forEachBeverages { print($0.description) }
    }
    
    mutating func raiseMoney(fiveThousandCount: Int, thousandCount: Int, fiveHundredCount: Int, hundredCount: Int) {
        balance.raiseMoney(fiveThousandCount: fiveThousandCount, thousandCount: thousandCount, fiveHundredCount: fiveHundredCount, hundredCount: hundredCount)
    }

    func addStock(_ beverage: Beverage) {
        beverages.addBeverage(beverage)
    }

    mutating func reportAvailableBeverageNowMoney() -> [Beverage] {
        return beverages.reportAvailableBeverageNowMoney(confirmBalance())
    }

    mutating func purchaseBeverage(beverage: Beverage, price: Money) {
        balance.subtract(price)
        beverages.removeBeverage(beverage)
        purchasedList.append(beverage)
    }

    func confirmBalance() -> Money {
        return balance
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
