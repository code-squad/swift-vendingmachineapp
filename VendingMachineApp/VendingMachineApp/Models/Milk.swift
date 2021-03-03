//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Milk: Drink {
    
    private var fat: Int
    
    init(brand: String, capacity: Int, price: Money, name: String, date: Date, fat: Int, expiration: Date, hot: Bool, calorie: Int) {
        self.fat = fat
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: date, expiration: expiration, hot: hot, calorie: calorie )
    }
    
    func isLowFat() -> Bool {
        return fat < 30
    }
}
