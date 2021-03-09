//
//  BananaMilk.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class BananaMilk: Milk {
    private var bananaContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, lowFat: Int, bananaContent: Int) {
        self.bananaContent = bananaContent
        super.init(manufacturer: manufacturer,
        volume: volume,
        price: price,
        brand: brand,
        manufactured: manufactured,
        expiry: expiry,
        calorie: calorie,
        temperature: temperature,
        lowFat: lowFat)
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
                   lowFat: 10,
                   bananaContent: 20)
    }
}
