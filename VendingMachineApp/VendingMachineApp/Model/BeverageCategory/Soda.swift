//
//  BeverageClass.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import Foundation

class Soda: Beverage {
    
    private var transparent: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, transparent: Bool, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.transparent = transparent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
}


