//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Soda: Drink {
    
    private var zeroCalorie: Bool
    
    init(brand: String, capacity: Int, price: Money, name: String, date: Date, expiration: Date, hot: Bool, calorie: Int) {
        self.zeroCalorie = false
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: date, expiration: expiration, hot: hot, calorie: calorie )
        self.zeroCalorie = self.isZeroCalorie(unit: calorie)
    }
    
    func isZeroCalorie(unit: Int) -> Bool {
        return unit < 4
    }
}
