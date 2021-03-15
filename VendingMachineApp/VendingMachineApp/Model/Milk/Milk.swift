//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Milk: Beverage {
    private var pH: Double = 0
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date, expirationAt: Date, temperature: Double, pH: Double) {
        self.pH = pH
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt, expirationAt: expirationAt, temperature: temperature)
    }
    
    required init?(coder: NSCoder) {
        pH = coder.decodeDouble(forKey: "pH")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(pH, forKey: "pH")
        super.encode(with: coder)
    }
    
    func isFresh() -> Bool {
        return self.pH >= 6.5 && self.pH <= 6.7
    }
    
}
