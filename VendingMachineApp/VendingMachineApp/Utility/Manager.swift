//
//  Manager.swift
//  VendingMachine
//
//  Created by 이동건 on 24/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Manager {
    private weak var machine: VendingMachineManagerDelegate!
    var bundles: BeverageBundles {
        return machine.bundles
    }
    
    init(_ machine: VendingMachineManagerDelegate) {
        self.machine = machine
    }
    
    private func addStock(beverage: Beverage, count: Int) {
        for _ in 0..<count {
            machine.add(beverage)
        }
    }
    
    private func removeStock(at index: Int) throws -> Beverage {
        guard let beverage = try machine?.remove(at: index) else { throw VendingMachineError.unknown }
        return beverage
    }
}

extension Manager: VendingMachineHandlerDelegate {
    typealias Menu = ManagerMenu
    
    func handle(_ menu: ManagerMenu, value: Int = 0) throws -> Comment? {
        return nil
    }
}
