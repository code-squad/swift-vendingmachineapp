//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class VendingMachine {
    private var inventory = Inventory()
    private var balance = 0
    
    var stockList: String {
        return "\(inventory)"
    }
    
    func insert(money: Int) {
        balance += money
    }
    
    func fill(beverage: Beverage) {
        inventory.add(beverage)
    }
}
