//
//  Money.swift
//  VendingMachineApp
//
//  Created by delma on 2020/03/07.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
struct Money {
private var money: [String:Int] = ["fiveThousand" : 0, "thousand" : 0, "fiveHundred" : 0, "hundred" : 0]
    
    mutating func raiseMoney(fiveThousandCount: Int, thousandCount: Int, fiveHundredCount: Int, hundredCount: Int) {
         let insertedMoney = ["fiveThousand": fiveThousandCount, "thousand": thousandCount, "fiveHundred": fiveHundredCount, "hundred": hundredCount]
              for (moneyType, count) in insertedMoney {
                  guard let value = money[moneyType] else { return }
                  money.updateValue(count + value, forKey: moneyType)
              }
    }
    
    mutating func confirmBalance(_ change: Int) -> Int {
        var balance = change
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
    
    
}
