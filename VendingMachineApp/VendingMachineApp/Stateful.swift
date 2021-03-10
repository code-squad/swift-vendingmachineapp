//
//  Stateful.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/10.
//

import Foundation

protocol Stateful: class {
    var vendingMachine: VendingMachine! { get set }
}

extension Stateful {
    func passVendingMachineState(to destination: Stateful) {
        destination.vendingMachine = vendingMachine
    }
}
