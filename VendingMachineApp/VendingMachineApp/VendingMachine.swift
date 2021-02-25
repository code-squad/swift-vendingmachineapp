//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/25.
//

import Foundation

class VendingMachine {
    private var beverages: [Beverage]
    
    init(beverages: [Beverage]) {
        self.beverages = beverages
    }
    
    func retrieveBeverage(completion: (Beverage) -> Void) {
        beverages.forEach{
            completion($0)
        }
    }
}
