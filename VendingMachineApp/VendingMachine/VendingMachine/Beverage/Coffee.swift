//
//  Coffee.swift
//  VendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let ice: Bool
    
    init(ice: Bool, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.ice = ice
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: Date(timeInterval: 18144000, since: dateOfManufacture))
    }
    
    func isHot() -> Bool {
        return ice == false
    }
}

class Kanu: Coffee {
    private let kindOfKanu: String
    
    init(kindOfKanu: String, ice: Bool, brand: String, volume: Int, price: Int, productName: String) {
        self.kindOfKanu = kindOfKanu
        super.init(ice: ice, brand: brand, volume: volume, price: price, productName: productName)
    }
}
class TOP: Coffee {
    private let flavor: String
    
    init(flavor: String, ice: Bool, brand: String, volume: Int, price: Int, productName: String) {
        self.flavor = flavor
        super.init(ice: ice, brand: brand, volume: volume, price: price, productName: productName)
    }
}
