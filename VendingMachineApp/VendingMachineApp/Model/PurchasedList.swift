//
//  purchasedList.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/25.
//

import Foundation

class PurchasedList {
    private(set) var beverages : [Beverage]
    
    init() {
        self.beverages = []
    }
    
    func add(beverage : Beverage) {
        beverages.append(beverage)
    }
}
