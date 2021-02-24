//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class VendingMachine {
    
    private var beverages: [Beverage]
    
    init() {
        beverages = []
    }
    
    func addBeverage(_ beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func beverageInfo(_ printer: (Beverage) -> ()) {
        beverages.forEach { (beverage) in
            printer(beverage)
        }
    }
}
