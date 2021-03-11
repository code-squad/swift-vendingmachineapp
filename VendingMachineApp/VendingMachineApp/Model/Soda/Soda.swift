//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Soda: Beverage {
    
    private let suger: Int
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, suger: Int) {
        self.suger = suger
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt)
    }
  
    required init() {
        suger = 0
        super.init(brand: "brand", volume: 0, price: 0, name: "name", createdAt: Date(), expiredAt: Date())
    }
    
    func isLowSugar() -> Bool {
        let criteria = 30
        return suger <= criteria
    }
}
