//
//  InventoryCountable.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol InventoryCountable {
    func countBeverageQuantity(beverageMenu: BeverageMenu) -> Int
    func countCurrentInventory() -> [BeverageBox]
}
