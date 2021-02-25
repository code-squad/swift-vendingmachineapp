//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Coffee: Beverage {
    private var caffeineContent: Double
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, caffeineContent: Double) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
    func isHighCaffeine() -> Bool {
        return self.caffeineContent >= 0.15
    }
}
