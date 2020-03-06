//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Coffee: Beverage {
    private var isContainMilk: Bool
    private var flavor: Flavor
    private var package: Packages
//    private var isHot: Bool
    
    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date, isContainMilk: Bool, flavor: Flavor, package: Packages, temperature: Int) {
        self.isContainMilk = isContainMilk
        self.flavor = flavor
        self.package = package
//        self.isHot = isHot
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, temperature: temperature)
    }
    
    enum Flavor {
        case americano
        case vanilla
        case mocha
        case latte
    }
    
    enum Packages{
        case glass
        case can
        case plastic
    }
}
