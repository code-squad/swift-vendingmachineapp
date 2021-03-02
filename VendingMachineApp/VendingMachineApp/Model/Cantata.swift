//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/02.
//

import Foundation

class Cantata: Coffee {
    
    private var category: String
    
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, caffeineContent: Int) {
        self.category = "칸타타"
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, caffeineContent: caffeineContent)
    }
}
