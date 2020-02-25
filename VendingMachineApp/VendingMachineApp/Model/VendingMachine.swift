//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

struct VendingMachine {
    var stock = Stock()
    var money = 0
    
    func addBeverage(beverage: Beverage) {
        stock.add(beverage: beverage)
    }
    
    func printStock() {
        stock.printAll()
    }
    
    mutating func putMoney(_ money: Int) {
        self.money += money
    }
}
