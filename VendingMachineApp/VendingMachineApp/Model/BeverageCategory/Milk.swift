//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/26.
//

import Foundation

class Milk: Beverage {
    
    private var calorieContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, calorieContent: Int, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.calorieContent = calorieContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
}


