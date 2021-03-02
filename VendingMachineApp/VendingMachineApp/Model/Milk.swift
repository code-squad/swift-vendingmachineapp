//
//  Milk.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import Foundation

class Milk: Beverage {
    
    private var lowFat: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, lowFat: Bool) {
        self.lowFat = lowFat
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
}
