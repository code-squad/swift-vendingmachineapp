//
//  Cantata.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class Cantata: Coffee {
    private var type: String
    
    override init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expirydate: Date, calorie: Int, hot: Int, caffeineContent: Int) {
        self.type = "Cantata"
        super.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expirydate: expirydate,
                   calorie: calorie,
                   hot: hot,
                   caffeineContent: caffeineContent)
    }
}
