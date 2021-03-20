//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/05.
//

import Foundation

class Soda: Beverage {
    
    private var sugarContent: Int
    
    required init() {
        self.sugarContent = 0
        super.init()
    }
    
    required init?(coder: NSCoder) {
        self.sugarContent = coder.decodeInteger(forKey: "sugarContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(sugarContent, forKey: "sugarContent")
        super.encode(with: coder)
    }
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, sugarContent: Int, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.sugarContent = sugarContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
}
