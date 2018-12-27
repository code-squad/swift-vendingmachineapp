//
//  ValidCheck.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 21..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct ValidChecker {
    static func checkManagerInput(string: String, countOfBeverage: Int) -> Bool {
        let regexOfAddBevergage = "^1 [1-\(countOfBeverage)]$"
        let regexOfTwo = "^2$"
        return checkInput(string: string, regex: regexOfAddBevergage)
            || checkInput(string: string, regex: regexOfTwo)
    }

    static func checkUserInput(string: String, count: Int) -> Bool {
        let regexOfInsertMoney = "^1 (\\d)+$"
        let regexOfPurchaseBeverage = "^2 [1-\(count)]$"
        return checkInput(string: string, regex: regexOfInsertMoney)
            || checkInput(string: string, regex: regexOfPurchaseBeverage)
    }

    static private func checkInput(string: String, regex: String) -> Bool {
        return string.range(of: regex, options: .regularExpression) != nil
    }
}
