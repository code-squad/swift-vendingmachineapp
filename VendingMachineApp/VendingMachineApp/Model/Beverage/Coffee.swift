//
//  Coffee.swift
//  VendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let temperature: Int
    
    init(temperature: Int, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.temperature = temperature
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: Date(timeInterval: 18144000, since: dateOfManufacture))
    }
    
    func isHot() -> Bool {
        return temperature > 65
    }
}

class Kanu: Coffee {
    private let kindOfKanu: String
    
    init(kindOfKanu: String, temperature: Int, brand: String, volume: Int, price: Int, productName: String) {
        self.kindOfKanu = kindOfKanu
        super.init(temperature: temperature, brand: brand, volume: volume, price: price, productName: productName)
    }
}
class TOP: Coffee {
    private let flavor: String
    
    init(flavor: String, temperature: Int, brand: String, volume: Int, price: Int, productName: String) {
        self.flavor = flavor
        super.init(temperature: temperature, brand: brand, volume: volume, price: price, productName: productName)
    }
}
