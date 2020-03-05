//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class VendingMachine {
    private var inventory = Inventory()
    private(set) var balance = 0
    private var salesLog = [Beverage]()
    
    var stockList: String {
        return "\(inventory)"
    }
    
    func insert(money: Int) {
        balance += money
    }
    
    func fill(beverage: Beverage) {
        inventory.add(beverage)
    }
    
    func sell(beverage: String) {
        inventory.takeOut(beverage, balance: balance) { result in
            switch result {
            case let .fail(error): print(error.localizedDescription)
            case let .success(beverage):
                balance -= beverage.price
                salesLog.append(beverage)
            }
        }
    }
    
    func repeatForSalesLog(_ block: (Beverage) -> Void) {
        salesLog.forEach { block($0) }
    }
}
