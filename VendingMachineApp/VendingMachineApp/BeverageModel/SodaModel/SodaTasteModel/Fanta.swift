//
//  PepsiCola.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Fanta: Soda {
    private let isFantastic: Bool

    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, zeroCalories: Bool, isFantastic: Bool) {
        self.isFantastic = isFantastic
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate, zeroCalories: zeroCalories)
    }
    
    convenience override init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, zeroCalories: Bool) {
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, zeroCalories: zeroCalories, isFantastic: true)
    }
    
    convenience init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, zeroCalories: false, isFantastic: true)
    }
}
