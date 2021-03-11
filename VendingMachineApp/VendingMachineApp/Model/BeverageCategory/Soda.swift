//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/05.
//

import Foundation

class Soda: Beverage {
    
    private var sugarContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, sugarContent: Int, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.sugarContent = sugarContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
}
