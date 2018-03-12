//
//  VendingMachineBase.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 12..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct VendingMachineBase {
    
    private var vendingMachine : BaseMode
    
    init(_ machine : BaseMode) {
        self.vendingMachine = machine
    }
    
    mutating func addBeverage(_ product: Beverage) {
        vendingMachine.addBeverage(product)
    }
    
    mutating func addMoney(_ userMoney: VendingMachine.AvailableMoney) {
        vendingMachine.addMoney(userMoney)
    }
    
    func getBalance() -> Int {
        return vendingMachine.getBalance()
    }
    
    func generateCountOfProduct() -> [Int] {
        return vendingMachine.generateCountOfProduct()
    }


}
