//
//  StrawBerryMilk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class StrawBerryMilk: Milk & FoodColoringApplicable {
    private let strawBerryFarm: LocationTrackable
    var foodColoring: FoodColoring?
    
    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, milkFarm: LocationTrackable, strawBerryFarm: LocationTrackable, foodColoring: FoodColoring?) {
        self.strawBerryFarm = strawBerryFarm
        self.foodColoring = foodColoring
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate, farm: milkFarm)
    }
    
    func isUsingFoodColoring() -> Bool {
        return foodColoring != nil
    }
}

