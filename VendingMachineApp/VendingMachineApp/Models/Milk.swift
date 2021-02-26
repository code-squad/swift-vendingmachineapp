//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Milk: Drink {
    
    private var lowFat: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, lowFat: Bool, expiration: Date, hot: Bool, calorie: Int) {
        self.lowFat = lowFat
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date, expiration: expiration, hot: hot, calorie: calorie )
    }
    
    func isLowFat() -> Bool {
        return lowFat
    }
}
