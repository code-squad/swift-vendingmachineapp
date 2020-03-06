//
//  Soda.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Soda: Beverage {
    private var sugarRatio: SugarRatio
    private var flavor: Flavor

    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date, sugarRatio: SugarRatio, flavor: Flavor, temperature: Int) {
        self.sugarRatio = sugarRatio
        self.flavor = flavor
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, temperature: temperature)
    }
    
    enum Flavor {
        case coke
        case cider
        case strawberry
        case apple
    }

    enum SugarRatio {
        case original
        case lower
        case free
    }
}
