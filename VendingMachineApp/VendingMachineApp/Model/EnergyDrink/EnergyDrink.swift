//
//  EnergyDrink.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/25.
//

import Foundation

class EnergyDrink: Beverage {
    private var taurineContent: Int
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, expirationDate: Date, temperature: Double, taurineContent: Int) {
        self.taurineContent = taurineContent
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, expirationDate: expirationDate, temperature: temperature)
    }
    func isHighTaurine() -> Bool {
        return self.taurineContent > 1000
    }
}
