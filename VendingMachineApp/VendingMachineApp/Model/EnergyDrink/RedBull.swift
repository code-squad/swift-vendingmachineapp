//
//  RedBull.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/01.
//

import Foundation

class RedBull: EnergyDrink {
    private var vitaminB: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date, expirationAt: Date, temperature: Double, taurineContent: Int, vitaminB: Int) {
        self.vitaminB = vitaminB
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt, expirationAt: expirationAt, temperature: temperature, taurineContent: taurineContent)
    }
    convenience init() {
        self.init(brand: "RedBull", capacity: 250, price: 1000, name: "redBull", manufacturedAt: Date.input("20210304"), expirationAt: Date.input("20210310"), temperature: 5, taurineContent: 1000, vitaminB: 2)
    }
    
    required init?(coder: NSCoder) {
        vitaminB = coder.decodeInteger(forKey: "vitaminB") 
        super.init(coder: coder)
    }
    override func encode(with coder: NSCoder) {
        coder.encode(vitaminB, forKey: "vitaminB")
        super.encode(with: coder)
    }
    
    func hasVitaminB() -> Bool {
        return self.vitaminB > 0
    }
}
