//
//  AdminVendingMachine.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2018. 1. 15..
//  Copyright © 2018년 Napster. All rights reserved.
//

import Foundation

class AdminVendingMachine: AdminAble {
    private var vendingMachine: AdminAble
    
    init(_ machine: AdminAble) {
        self.vendingMachine = machine
    }
    
    func addBeverage(_ item: Beverage) {
        vendingMachine.addBeverage(item)
    }
}
