//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Soda: Beverage {
    private var zeroCalories: Bool
   
    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, zeroCalories: Bool) {
        self.zeroCalories = zeroCalories
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate)
    }
    
    convenience override init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packDate: packDate, zeroCalories: false)
    }
}
