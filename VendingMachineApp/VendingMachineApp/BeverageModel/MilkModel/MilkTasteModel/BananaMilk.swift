//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class BananaMilk: Milk & FoodColoringApplicable {
    private let bananaFarm: LocationTrackable
    var foodColoring: Bool
    
    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, milkFarm: LocationTrackable, bananaFarm: LocationTrackable, foodColoring: Bool) {
        self.bananaFarm = bananaFarm
        self.foodColoring = foodColoring
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate, farm: milkFarm)
    }
    
    func isUsingFoodColoring() -> Bool {
        return foodColoring
    }
}
