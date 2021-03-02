//
//  Sprite.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class Sprite: Soda {
    private var lemonContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiryTime: Date, calorie: Int, temperature: Int, flavor: String, lemonContent: Int) {
        self.lemonContent = lemonContent
        super.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expiryTime: expiryTime,
                   calorie: calorie,
                   temperature: temperature,
                   flavor: flavor)
    }
}
