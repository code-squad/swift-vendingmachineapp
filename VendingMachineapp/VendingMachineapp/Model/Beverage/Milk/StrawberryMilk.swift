//
//  StrawberryMilk.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class StrawberryMilk: Milk {
    private var strawberryContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiryTime: Date, calorie: Int, temperature: Int, lowFat: Int, strawberryContent: Int) {
        self.strawberryContent = strawberryContent
        super.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expiryTime: expiryTime,
                   calorie: calorie,
                   temperature: temperature,
                   lowFat: lowFat)
    }
}
