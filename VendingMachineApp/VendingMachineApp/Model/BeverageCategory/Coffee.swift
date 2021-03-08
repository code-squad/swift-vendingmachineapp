//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/26.
//

import Foundation

class Coffee: Beverage {
    
    private var whiteCoffee: Bool
    private var isHot: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, whiteCoffee: Bool, isHot: Bool, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.whiteCoffee = whiteCoffee
        self.isHot = isHot
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    public func hot() -> Bool {
        return isHot
    }
    
}




