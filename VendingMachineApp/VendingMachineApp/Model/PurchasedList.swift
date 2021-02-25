//
//  purchasedList.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/25.
//

import Foundation

class PurchasedList {
    private(set) var purchasedList : [Beverage]
    
    init() {
        self.purchasedList = []
    }
    
    func addBeverage(beverage : Beverage) {
        purchasedList.append(beverage)
    }
    
    func sumBeveragesPrice() -> Int {
        return purchasedList.reduce(0) { $1.price }
    }
}
