//
//  Milk.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class Milk: Beverage {
    private var lowFat: Bool
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expirydate: Date, calorie: Int, hot: Int, lowFat: Bool) {
        self.lowFat = lowFat
        super.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expirydate: expirydate,
                   calorie: calorie,
                   hot: hot)
    }
    
    func isLowFat() -> Bool {
        return self.lowFat
    }
}
