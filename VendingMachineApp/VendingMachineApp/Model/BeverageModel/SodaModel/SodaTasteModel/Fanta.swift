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
    
    override func encode(with coder: NSCoder) {
        coder.encode(foodColoring, forKey: "foodColoring")
        coder.encode(caffeine, forKey: "caffeine")
        super.encode(with: coder)
    }
    
    required init?(coder eDecoder: NSCoder) {
        foodColoring = eDecoder.decodeObject(forKey: "bottle") as! FoodColoring?
        caffeine = eDecoder.decodeInteger(forKey: "caffeine")
        super.init(coder: eDecoder)
    }
    
    func isUsingFoodColoring() -> Bool {
        return foodColoring != nil
    }

    func highCaffeine(caffeine criterion: Int) -> Bool {
        return caffeine > criterion
    }
    
    func isBadForBody(caffeine: Int) -> Bool {
        isUsingFoodColoring() && highCaffeine(caffeine: caffeine)
    }
}
