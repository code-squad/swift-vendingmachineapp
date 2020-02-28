//
//  VendingMachineManager.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/28.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

protocol SomeDelegate {
    func someFunction(someProperty: Int)
}

class VendingMachineManager {
    var vendingMachine = VendingMachine()
}

extension VendingMachineManager: SomeDelegate {
    func someFunction(someProperty: Int) {
        vendingMachine.addBalance(Money(amount: someProperty))
    }
}
