//
//  Georgia.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class Georgia: Coffee {
    private var condensedMilkContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, caffeineContent: Int, condensedMilkContent: Int) {
        self.condensedMilkContent = condensedMilkContent
        super.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expiry: expiry,
                   calorie: calorie,
                   temperature: temperature,
                   caffeineContent: caffeineContent)
    }
}
