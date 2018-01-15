//
//  UserVendingMachine.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2018. 1. 15..
//  Copyright © 2018년 Napster. All rights reserved.
//

import Foundation

class UserVendingMachine: UserAble {
    private var vendingMachine: UserAble
    
    init(_ machine: UserAble) {
        self.vendingMachine = machine
    }
    
    func insertMoney(_ money: Int) {
        vendingMachine.insertMoney(money)
    }
    
    func vendingMachineBalance() -> Int {
        return vendingMachine.vendingMachineBalance()
    }
    
    func vendingMachineReceipt() -> [Beverage] {
        return vendingMachine.vendingMachineReceipt()
    }
    
    func buyBeverage(_ selectedValue: Beverage) throws {
        try vendingMachine.buyBeverage(selectedValue)
    }
    
}
