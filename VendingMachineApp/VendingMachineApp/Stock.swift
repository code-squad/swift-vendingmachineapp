//
//  Stock.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

struct Stock {
    // 재고 준비
    public static func prepareStock() -> [[Beverage]] {
        var beverages = [[Beverage]]()
        let numberOfBeverageType = Product.allCases.count
        for index in 0..<numberOfBeverageType {
            let numberPerItem = Int.random(in: 1...9)
            let beverage = AddingBeverage.select(target: index, amount: numberPerItem)
            beverages.append(beverage)
        }
        return beverages
    }
}
