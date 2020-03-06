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
    private var money: [String:Int] = ["fiveThousand" : 0, "thousand" : 0, "fiveHundred" : 0, "hundred" : 0]
    private(set) var balance = 0
    private var purchasedList: [Beverage] = []
    
    init() {
        beverages = Beverages()
    }
    
    func showTotalStock() {
        beverages.forEachBeverages { print($0.description) }
    }
    
    mutating func raiseMoney(fiveThousandCount: Int, thousandCount: Int, fiveHundredCount: Int, hundredCount: Int) {
         let insertedMoney = ["fiveThousand": fiveThousandCount, "thousand": thousandCount, "fiveHundred": fiveHundredCount, "hundred": hundredCount]
              for (moneyType, count) in insertedMoney {
                  guard let value = money[moneyType] else { return }
                  money.updateValue(count + value, forKey: moneyType)
              }
       balance = confirmBalance()
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
        balance -= price
        beverages.removeBeverage(beverage)
        purchasedList.append(beverage)
    }

    mutating func confirmBalance() -> Int {
        for (key, value) in money {
            var temp = 0
            switch key {
            case "fiveThousand":
                temp += value * 5000
            case "thousand":
                temp += value * 1000
            case "fiveHundred":
                temp += value * 500
            case "hundred":
                temp += value * 100
            default:
                temp = 0
            }
            balance += temp
        }
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
