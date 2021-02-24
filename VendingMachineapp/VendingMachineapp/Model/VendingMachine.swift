//
//  VendingMachine.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class VendingMachine {
    private var inventory: [Beverage] = []
    
    func addBeverage(beverage: Beverage) {
        inventory.append(beverage)
    }
    func printList() {
        inventory.forEach({ (item) in
            print(item)
        })
    }
}
