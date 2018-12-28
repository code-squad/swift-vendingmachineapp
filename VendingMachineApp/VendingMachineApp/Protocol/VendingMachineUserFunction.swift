//
//  VendingMachineUserFunction.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 25..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol VendingMachineUserFunction {
    mutating func insert(money: Int)
    func buyableProductList() -> [String: BeverageInfo]
    mutating func buy(productName: String) -> Beverage?
    func checkBalance() -> String
    func checkInventory() -> [String: Int]
    func hotProducts() -> [String]
}
