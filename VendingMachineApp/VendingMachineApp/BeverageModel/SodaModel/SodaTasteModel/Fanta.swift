//
//  PepsiCola.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Fanta: Soda & IsHazardous {
    var foodColoring: FoodColoring?
    var caffeine: Int
    
    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, zeroCalories: Bool, foodColoring: FoodColoring?, caffeine: Int) {
        self.foodColoring = foodColoring
        self.caffeine = caffeine
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate, zeroCalories: zeroCalories)
    }
    
    func isUsingFoodColoring() -> Bool {
        return foodColoring != nil
    }

    func highCaffeine() -> Bool {
        return caffeine > 100
    }
    
    func isBadForBody() -> Bool {
        isUsingFoodColoring() && highCaffeine()
    }
}
