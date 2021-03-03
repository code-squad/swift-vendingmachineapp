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
    
    init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date, calories: Int, foodColoring: FoodColoring?, caffeine: Int) {
        self.foodColoring = foodColoring
        self.caffeine = caffeine
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, calories: calories)
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
