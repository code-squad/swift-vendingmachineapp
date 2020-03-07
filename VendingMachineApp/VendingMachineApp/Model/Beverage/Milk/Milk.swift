//
//  Milk.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Milk: Beverage {
    private var fatRatio: FatRatio

    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date, fatRatio: FatRatio, temperature: Int) {
        self.fatRatio = fatRatio
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, temperature: temperature)
    }

    enum FatRatio {
        case original
        case lower
        case free
    }
    
}
