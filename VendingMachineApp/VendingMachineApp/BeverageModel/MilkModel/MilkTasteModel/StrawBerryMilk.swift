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
    
    init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date, milkFarm: LocationTrackable, strawBerryFarm: LocationTrackable, foodColoring: FoodColoring?) {
        self.strawBerryFarm = strawBerryFarm
        self.foodColoring = foodColoring
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, farm: milkFarm)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(strawBerryFarm, forKey: "strawBerryFarm")
        coder.encode(foodColoring, forKey: "foodColoring")
        super.encode(with: coder)
    }
    
    required init?(coder eDecoder: NSCoder) {
        strawBerryFarm = eDecoder.decodeObject(forKey: "strawBerryFarm") as! LocationTrackable
        foodColoring = eDecoder.decodeObject(forKey: "foodColoring") as! FoodColoring?
        super.init(coder: eDecoder)
    }
    
    func isUsingFoodColoring() -> Bool {
        return foodColoring != nil
    }
}

