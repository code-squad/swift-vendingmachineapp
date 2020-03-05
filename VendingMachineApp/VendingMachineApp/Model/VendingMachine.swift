//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by delma on 29/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
struct VendingMachine {
    var beverages: Beverages
    var money: [String:Int] = ["fiveThousand" : 0, "thousand" : 0, "fiveHundred" : 0, "hundred" : 0]
    var balance = 0
    var purchasedList: [Beverage] = []
    
    func showTotalStock() {
        beverages.forEachBeverages { print($0.description) }
    }
    
    mutating func raiseMoney(fiveThousandCount: Int, thousandCount: Int, fiveHundredCount: Int, hundredCount: Int) {
        let insertedMoney = [fiveThousandCount, thousandCount, fiveHundredCount, hundredCount]
        for moneyType in insertedMoney {
            let key = String(moneyType) + "Count"
             guard let value = money[key] else { return }
            money.updateValue(moneyType + value, forKey: key)
        }
       balance = confirmBalance()
    }

    func addStock(_ beverage: Beverage) {
        beverages.addBeverage(beverage)
    }

    mutating func reportAvailableBeverageNowMoney() -> [Beverage] {
        let nowBalance = confirmBalance()
        var purchasbleBeverages: [Beverage] = []
        beverages.forEachBeverages { (beverage) in
            if beverage.price > nowBalance {
                purchasbleBeverages.append(beverage)
            }
        }
        return purchasbleBeverages
    }

    mutating func purchaseBeverage(beverage: Beverage, price: Int) {
        balance -= price
        beverages.removeBeverage(beverage)
        purchasedList.append(beverage)
    }

    mutating func confirmBalance() -> Int {
        for (key, value) in money {
            var tmp = 0
            if key.contains("thousand") {
                tmp += value * 1000
            }else if key.contains("five") {
                tmp += value * 5
            }
            balance += tmp
        }
        return balance
    }
    
    func reportTotalStock() -> [Beverage:Int] {
        return beverages.reportKindWithCount()
    }
    
    func confirmOverdateStock() -> [Beverage] {
        var overExpirationBeverage: [Beverage] = []
        beverages.forEachBeverages { (beverage) in
            if beverage.manufacturedDate < beverage.expirationDate {
                overExpirationBeverage.append(beverage)
            }
        }
        return overExpirationBeverage
    }

    func verifyHotBeverages() -> [Beverage] {
       return beverages.verifyHotBeverages()
    }
    
    func reportPurchasedHistory() -> [Beverage] {
        return purchasedList
    }
}
