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
    
    func addHistory(beverage : Beverage) {
        beverages.append(beverage)
    }
    
    func sumBeveragesPrice() -> Int {
        return beverages.reduce(0) { $1.price }
    }
}
