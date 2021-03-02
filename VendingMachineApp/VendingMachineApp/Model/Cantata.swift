//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/02.
//

import Foundation

class Cantata: Coffee {
    
    private var temperature: Double
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, caffeineContent: Int, temperature: Double) {
        self.temperature = temperature
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, caffeineContent: caffeineContent)
    }
}
