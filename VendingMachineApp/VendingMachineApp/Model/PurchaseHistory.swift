//
//  PurchaseHistory.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/02.
//

import Foundation

class PurchaseHistory {
    private(set) var beverages: [Beverage]
    
    init() {
        self.beverages = []
    }
    
    public func append(item beverage: Beverage) {
        beverages.append(beverage)
    }
}
