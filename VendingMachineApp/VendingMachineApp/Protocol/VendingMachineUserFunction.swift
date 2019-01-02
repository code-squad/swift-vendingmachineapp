//
//  VendingMachineUserFunction.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 25..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol VendingMachineUserFunction: ReadableInventory {
    mutating func insert(money: Money)
    mutating func buy(productName: String) -> Beverage?
    func readBalance() -> String
    func hotProducts() -> [String]
}
