//
//  Georgia.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class Georgia: Coffee {
    private var type: String
    
    override init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiryTime: Date, calorie: Int, temperature: Int, caffeineContent: Int) {
        self.type = "Georgia"
        super.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expiryTime: expiryTime,
                   calorie: calorie,
                   temperature: temperature,
                   caffeineContent: caffeineContent)
    }
}
