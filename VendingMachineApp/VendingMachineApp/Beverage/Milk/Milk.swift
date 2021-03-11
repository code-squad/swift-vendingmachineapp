//
//  Milk.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class Milk: Beverage {
    
    private let fat: Double
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temparature: Int, calories: Int, fat: Double) {
        self.fat = fat
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, temparature: temparature, calories: calories)
    }
    
    required init?(coder: NSCoder) {
        self.fat = coder.decodeDouble(forKey: "milkFat")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(fat, forKey: "milkFat")
        super.encode(with: coder)
    }
    
    func isLowFat(standard: Double) -> Bool {
        return self.fat <= standard ? true : false
    }
}
