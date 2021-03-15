//
//  EnergyDrink.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/25.
//

import Foundation

class EnergyDrink: Beverage {
    private var taurineContent: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date, expirationAt: Date, temperature: Double, taurineContent: Int) {
        self.taurineContent = taurineContent
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt, expirationAt: expirationAt, temperature: temperature)
    }
    
    required init?(coder: NSCoder) {
        taurineContent = coder.decodeInteger(forKey: "taurineContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(taurineContent, forKey: "taurineContent")
        super.encode(with: coder)
    }
    
    func isHighTaurine() -> Bool {
        return self.taurineContent > 1000
    }
}
