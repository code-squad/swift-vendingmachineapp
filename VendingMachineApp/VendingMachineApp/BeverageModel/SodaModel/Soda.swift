//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Soda: Beverage {
    private var calories: Int
   
    init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date, calories: Int) {
        self.calories = calories
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime)
    }
    
    convenience override init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, calories: 0)
    }
    
    func isZeroCalorie() -> Bool {
        return self.calories == 0
    }
}
