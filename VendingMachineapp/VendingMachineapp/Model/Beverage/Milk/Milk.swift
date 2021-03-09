//
//  Milk.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class Milk: Beverage {
    private var lowFat: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, lowFat: Int) {
        self.lowFat = lowFat
        super.init(manufacturer: manufacturer,
        volume: volume,
        price: price,
        brand: brand,
        manufactured: manufactured,
        expiry: expiry,
        calorie: calorie,
        temperature: temperature)
    }
    
    required convenience init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int) {
        self.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expiry: expiry,
                   calorie: calorie,
                   temperature: temperature,
                   lowFat: 0)
    }
}
