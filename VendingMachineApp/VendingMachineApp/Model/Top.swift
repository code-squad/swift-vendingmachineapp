//
//  Top.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/02.
//

import Foundation

class Top: Coffee {
    
    private var category: String
    
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, caffeineContent: Int) {
        self.category = "TOP"
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, caffeineContent: caffeineContent)
    }
}
