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
    
    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, isContainMilk: Bool, flavor: Flavor, package: Packages) {
        self.isContainMilk = isContainMilk
        self.flavor = flavor
        self.package = package
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate)
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
