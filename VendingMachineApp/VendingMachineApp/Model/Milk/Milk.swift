//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Milk: Beverage {
    private let fatPercent: Int
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, fatPercent: Int) {
        self.fatPercent = fatPercent
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt)
    }
  
    required init() {
        fatPercent = 0
        super.init()
    }
    
    func isLowFat() -> Bool {
        let criteria = 2
        return fatPercent <= criteria
    }
}
