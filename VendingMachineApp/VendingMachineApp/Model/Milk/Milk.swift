//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Milk: Beverage {
    private var pH: Double = 0
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, pH: Double) {
        self.pH = pH
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
    func isFresh() -> Bool {
        return self.pH >= 6.5 && self.pH <= 6.7
    }
    
}
