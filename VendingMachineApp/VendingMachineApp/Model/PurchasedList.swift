//
//  PurchasedList.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/03.
//

import Foundation

class PurchasedList {
    private var purchasedDrinks: [Beverage]
    
    init(_ purchasedDrinks: [Beverage]) {
        self.purchasedDrinks = purchasedDrinks
    }
    convenience init() {
        self.init([])
    }
    
    func add(with beverage: Beverage) {
        self.purchasedDrinks.append(beverage)
    }
    
    func givePurchasedList() -> PurchasedList {
        return PurchasedList(purchasedDrinks)
    }
}
