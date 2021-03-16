//
//  VendingMachineStateShareable.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/10.
//

import Foundation

protocol VendingMachineStateShareable: class {
    var vendingMachine: VendingMachine! { get set }
}

extension VendingMachineStateShareable {
    func passVendingMachineState(to destination: VendingMachineStateShareable) {
        destination.vendingMachine = vendingMachine
    }
}
