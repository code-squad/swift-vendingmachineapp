//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class VendingMachine {
    private let beverages: [Beverage]
    
    init(beverages: [Beverage]) {
        self.beverages = beverages
    }
    
    func printBeverages() {
        beverages.forEach { beverage in
            print(beverage)
        }
    }
}
