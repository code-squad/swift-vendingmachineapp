//
//  StrawBerryMilk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class StrawBerryMilk: Milk & FoodColoringApplicable {
    public let strawBerryFarm: LocationTrackable
    var foodColoring: FoodColoring?
    
    init(brand: String, size: Int, price: Int, name: String, packageTime: Date, milkFarm: LocationTrackable, strawBerryFarm: LocationTrackable, foodColoring: FoodColoring?) {
        self.strawBerryFarm = strawBerryFarm
        self.foodColoring = foodColoring
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, farm: milkFarm)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(strawBerryFarm, forKey: "strawBerryFarm")
        coder.encode(foodColoring, forKey: "foodColoring")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        strawBerryFarm = coder.decodeObject(forKey: "strawBerryFarm") as! LocationTrackable
        foodColoring = coder.decodeObject(forKey: "foodColoring") as! FoodColoring?
        super.init(coder: coder)
    }
    
    func isUsingFoodColoring() -> Bool {
        return foodColoring != nil
    }
}

