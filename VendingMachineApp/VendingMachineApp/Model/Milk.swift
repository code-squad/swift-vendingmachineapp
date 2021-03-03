//
//  Milk.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import Foundation

class Milk: Beverage {
    
    private var fatContent: Double
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, fatContent: Double) {
        self.fatContent = fatContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
    
    func isLowFat() -> Bool {
        return fatContent <= 2.6 ? true : false
    }
}
