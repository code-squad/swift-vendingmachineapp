//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class BananaMilk: Milk & FoodColoringApplicable {
    private let bananaFarm: LocationTrackable
    var foodColoring: FoodColoring?
    
    init(brand: String, size: Int, price: Int, name: String, packageTime: Date, milkFarm: LocationTrackable, bananaFarm: LocationTrackable, foodColoring: FoodColoring?) {
        self.bananaFarm = bananaFarm
        self.foodColoring = foodColoring
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, farm: milkFarm)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(bananaFarm, forKey: "bananaFarm")
        coder.encode(foodColoring, forKey: "foodColoring")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        bananaFarm = coder.decodeObject(forKey: "bananaFarm") as! LocationTrackable
        foodColoring = coder.decodeObject(forKey: "foodColoring") as! FoodColoring?
        super.init(coder: coder)
    }
    
    func isUsingFoodColoring() -> Bool {
        return foodColoring != nil
    }
}
