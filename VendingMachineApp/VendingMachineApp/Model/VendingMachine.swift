//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class VendingMachine {
    private var stock = Stock()
    
    func addBeverage(beverage: Beverage) {
        stock.add(beverage: beverage)
    }
    
    func printStock() {
        stock.printAll()
    }
}
