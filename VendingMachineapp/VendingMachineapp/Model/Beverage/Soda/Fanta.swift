//
//  Hwanta.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class Fanta: Soda {
    private var color: String
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, flavor: String, color: String) {
        self.color = color
        super.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expiry: expiry,
                   calorie: calorie,
                   temperature: temperature,
                   flavor: flavor)
    }
}
