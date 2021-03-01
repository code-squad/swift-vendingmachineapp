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
    
    private var inventory: [Beverage]

 
    init() {
        inventory = []
    }
    
    public func appendBeverage(kindOfBeverage: Beverage) {
        self.inventory.append(kindOfBeverage)
    }
}
