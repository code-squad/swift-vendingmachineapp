//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Milk: Beverage {
    
    private var fat: Int
    
    init(brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, fat: Int, expiration: Date, hot: Bool, calorie: Int) {
        self.fat = fat
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expiration: expiration, hot: hot, calorie: calorie )
    }
    
    required init() {
        self.fat = 0
        super.init()
    }
    
    required init?(coder: NSCoder) {
        self.fat = coder.decodeObject(forKey: "fat") as! Int
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(fat, forKey: "fat")
    }
    
    func isLowFat() -> Bool {
        return fat < 30
    }
}
