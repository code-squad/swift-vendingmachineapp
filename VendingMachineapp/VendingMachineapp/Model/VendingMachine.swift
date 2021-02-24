//
//  VendingMachine.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class VendingMachine {
    private var inventory = Inventory()
    
    func addBeverage(beverage: Beverage) {
        inventory.addBeverage(beverage: beverage)
    }
    func printList() {
        inventory.eachBeverage(handler: { (beverage) in
            print(beverage)
        })
    }
}
