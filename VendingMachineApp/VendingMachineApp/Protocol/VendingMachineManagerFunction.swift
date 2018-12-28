//
//  VendingMachineManagerFunction.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 25..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol VendingMachineManagerFunction: ReadableInventory {
    func expiredProducts() -> [Beverage]
    mutating func add(product: Beverage)
    mutating func removeExpiredProducts()
}
