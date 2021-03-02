//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import Foundation

class Coffee: Beverage {
    
    enum KindOfCoffee {
        case cantata
        case top
        case georgia
    }
    
    private var kind: KindOfCoffee
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, kind: KindOfCoffee) {
        self.kind = kind
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
}
