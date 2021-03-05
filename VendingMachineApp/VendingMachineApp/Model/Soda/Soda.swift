//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Soda: Beverage {
    
    private let sugarPercent: Int
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, sugarPercent: Int) {
        self.sugarPercent = sugarPercent
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt)
    }
    
    convenience init() {
        self.init(brand: "brand", volume: 0, price: 0, name: "name", createdAt: Date(), expiredAt: Date(), sugarPercent: 0)
    }
    
    func isLowSugar() -> Bool {
        let criteria = 2
        return sugarPercent <= criteria
    }
}
