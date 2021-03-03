//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/02.
//

import Foundation

class StrawberryMilk: Milk {
    
    enum FarmCode {
        case A, B, C, D
    }
    
    private var farmCode: FarmCode
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, fatContent: Double, farmCode: FarmCode) {
        self.farmCode = farmCode
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, fatContent: fatContent)
    }
    
}
