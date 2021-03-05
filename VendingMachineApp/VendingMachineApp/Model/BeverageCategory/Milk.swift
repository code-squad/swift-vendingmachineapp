//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/05.
//

import Foundation

class Milk: Beverage {
    
    private var flavored: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, flavored: Bool, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.flavored = flavored
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
}
