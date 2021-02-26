//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class VendingMachine: CustomStringConvertible {
    
    var description: String {
        return "\(Inventory)"
    }
    
    private var Inventory: [Beverage]

 
    init() {
        Inventory = []
    }
    
    public func appendBeverage(kindOfBeverage: Beverage) {
        self.Inventory.append(kindOfBeverage)
    }
}
