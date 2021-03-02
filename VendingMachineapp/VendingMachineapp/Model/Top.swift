//
//  Top.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class Top: Coffee {
    private var milkContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiryTime: Date, calorie: Int, temperature: Int, caffeineContent: Int, milkContent: Int) {
        self.milkContent = 20
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
