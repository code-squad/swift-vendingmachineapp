//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/02.
//

import Foundation

class BananaMilk: Milk {
    
    private var category: String
    
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, lowFat: Bool) {
        self.category = "바나나우유"
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, lowFat: lowFat)
    }
}
