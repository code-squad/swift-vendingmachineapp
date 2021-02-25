//
//  Staff.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/26.
//

import Foundation

class Staff {
    func fill(vendingMachine: VendingMachine, beverage: Beverage) {
        vendingMachine.add(beverage: beverage)
    }
    
    func checkStock(vendingMachine: VendingMachine) {
        vendingMachine.showStock()
    }
}
