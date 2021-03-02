//
//  RedBull.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/01.
//

import Foundation

class RedBull: EnergyDrink {
    private var vitaminB: Int
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, expirationDate: Date, temperature: Double, taurineContent: Int, vitaminB: Int) {
        self.vitaminB = vitaminB
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, expirationDate: expirationDate, temperature: temperature, taurineContent: taurineContent)
    }
    func hasVitaminB() -> Bool {
        return self.vitaminB > 0
    }
}
