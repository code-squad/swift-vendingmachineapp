//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import Foundation

class Coffee: Beverage {
    
    private var caffeineContent: Int
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, caffeineContent: Int) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
}
