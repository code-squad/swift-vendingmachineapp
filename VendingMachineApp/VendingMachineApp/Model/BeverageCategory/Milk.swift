//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/05.
//

import Foundation

class Milk: Beverage {
    
    private var calorieContent: Int
    
    required init() {
        self.calorieContent = 0
        super.init()
    }
    
    required init?(coder: NSCoder) {
        self.calorieContent = coder.decodeInteger(forKey: "calorieContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(calorieContent, forKey: "calorieContent")
        super.encode(with: coder)
    }
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, calorieContent: Int, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.calorieContent = calorieContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
}
