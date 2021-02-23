//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class VendingMachine {
    private var vendingMachine : [Beverage]
    
    init(beverage : [Beverage]) {
        vendingMachine = beverage
    }
    
    func showBeverageList(handler : (Beverage) -> ()) {
        vendingMachine.forEach {
            handler($0)
        }
    }
}
