//
//  PepsiCola.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Fanta: Soda & FoodColoringApplicable {
    var foodColoring: FoodColoring?
    
    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, zeroCalories: Bool, foodColoring: FoodColoring?) {
        self.foodColoring = foodColoring
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate, zeroCalories: zeroCalories)
    }
    
    func isUsingFoodColoring() -> Bool {
        return foodColoring != nil
    }
}
