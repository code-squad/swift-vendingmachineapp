//
//  Soda.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import Foundation

class Soda: Beverage {
    
    enum KindOfSoda {
        case coke
        case fanta
        case cider
    }
    
    private var kind: KindOfSoda
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, kind: KindOfSoda) {
        self.kind = kind
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
}
