//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class VendingMachine: OutputViewPrintable {
    
    private let inventory: [Beverage]
    
    init(inventory: [Beverage]) {
        self.inventory = inventory
    }
    
    func printBeverage(handler: (Beverage) -> ()) {
        inventory.forEach {
            handler($0)
        }
    }
}
