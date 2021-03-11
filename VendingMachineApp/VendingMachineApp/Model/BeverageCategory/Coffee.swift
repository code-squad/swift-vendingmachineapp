//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/05.
//

import Foundation

class Coffee: Beverage {
    
    private var agtronNumber: Int
    private var isHot: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, agtronNumber: Int, isHot: Bool, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.agtronNumber = agtronNumber
        self.isHot = isHot
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    public func hot() -> Bool {
        return isHot
    }
    
}
