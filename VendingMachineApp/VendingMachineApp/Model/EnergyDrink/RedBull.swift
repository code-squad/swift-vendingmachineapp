//
//  RedBull.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/01.
//

import Foundation

class RedBull: EnergyDrink {
    private var vitaminB: Int
    private var image = "HotSix"
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date, expirationAt: Date, temperature: Double, taurineContent: Int, vitaminB: Int) {
        self.vitaminB = vitaminB
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt, expirationAt: expirationAt, temperature: temperature, taurineContent: taurineContent)
    }
    
    func hasVitaminB() -> Bool {
        return self.vitaminB > 0
    }
}
