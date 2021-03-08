//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Coffee: Beverage {
    private var caffeineContent: Double
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date, expirationAt: Date, temperature: Double, caffeineContent: Double) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt, expirationAt: expirationAt, temperature: temperature)
    }
    
    func isHighCaffeine(with standard: Double) -> Bool {
        return String(format: "%.2f", self.caffeineContent) >= String(format: "%.2f", standard)
    }
}
