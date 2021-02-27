//
//  Coffee.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class Coffee: Beverage {
    private var caffeineContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expirydate: Date, calorie: Int, hot: Bool, caffeineContent: Int) {
        self.caffeineContent = caffeineContent
        super.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expirydate: expirydate,
                   calorie: calorie,
                   hot: hot)
    }
}
