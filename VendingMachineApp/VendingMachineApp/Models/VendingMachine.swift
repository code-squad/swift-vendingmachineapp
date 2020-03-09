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
    private var cashier: Calculable
    
    var stockList: String {
        return "\(inventory)"
    }
    
    init(cashier: Calculable) {
        self.cashier = cashier
    }
    
    func insert(money: Int) {
        cashier.addToBalance(money)
    }
    
    func fill(beverage: Beverage) {
        inventory.add(beverage)
    }
    
    func sell(beverage: String) {
        inventory.takeOut(beverage, balance: cashier.balance()) { result in
            switch result {
            case let .fail(error): print(error.localizedDescription)
            case let .success(beverage): cashier.sell(beverage: beverage)
            }
        }
    }
    
    func repeatForSalesLog(_ block: (Beverage) -> Void) {
        cashier.forEachSalesLog { block($0) }
    }
}
