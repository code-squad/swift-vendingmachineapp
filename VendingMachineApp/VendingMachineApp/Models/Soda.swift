//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Soda: Drink {
    
    private var zeroCalorie: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, isZero: Bool, expiration: Date, hot: Bool, calorie: Int) {
        self.zeroCalorie = isZero
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: date, expiration: expiration, hot: hot, calorie: calorie )
    }
    
    func isZeroCalorie() -> Bool {
        return zeroCalorie
    }
}
