//
//  FantaOrange.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation

class FantaOrange: Soda {
    
    private var fruity: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, transparent: Bool, flavour: String, manufacturedAt: Date, expiration: Date, fruity: Bool, skuName: String) {
        self.fruity = fruity
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, transparent: transparent, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "CocaCola", volume: 355, price: 1300, subbrand: "환타 오렌지맛", transparent: false, flavour: "Orange", manufacturedAt: manufacturedAt, expiration: expiration, fruity: true, skuName: "환타 오렌지맛 355ml 낱개")
    }
    
}
