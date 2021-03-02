//
//  Milk.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import Foundation

class Milk: Beverage {
    
    enum KindOfMilk {
        case strawberryMilk
        case chocolateMilk
        case bananaMilk
    }
    
    private var kind: KindOfMilk
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, kind: KindOfMilk) {
        self.kind = kind
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
}
