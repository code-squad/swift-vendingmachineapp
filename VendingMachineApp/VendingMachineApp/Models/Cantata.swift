//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/24.
//

import Foundation

class Cantata: Coffee {
    enum Flavor {
        case sweetAmericano, latte, mocha
    }
    
    private let flavor: Flavor
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int, caffeineContent: Int, temperature: Int, calorie: Int, flavor: Flavor, expiredAt: Date) {
        self.flavor = flavor
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price, caffeineContent: caffeineContent, temperature: temperature, calorie: calorie, expiredAt: expiredAt)
    }
}
