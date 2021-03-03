//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Milk: Beverage {
    private var pH: Double = 0
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, expirationDate: Date, temperature: Double, pH: Double) {
        self.pH = pH
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, expirationDate: expirationDate, temperature: temperature)
    }
    
    func isFresh() -> Bool {
        return self.pH >= 6.5 && self.pH <= 6.7
    }
    
}
