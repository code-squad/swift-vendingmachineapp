//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class VendingMachine: CustomStringConvertible {
    
    var description: String {
        return "\(inventory)"
    }
    
    private var inventory: Inventory

 
    init() {
        self.inventory = Inventory()
    }
    
    public func appendBeverage(beverage: Beverage) {
        inventory.appendBeverage(beverage: beverage)
    }
}
