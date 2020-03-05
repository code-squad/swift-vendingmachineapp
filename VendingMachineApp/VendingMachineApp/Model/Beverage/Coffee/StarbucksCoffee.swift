//
//  StarbucksCoffee.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class StarbucksCoffee: Coffee {
    private var isContainMilk: Bool = true
    private var flavor: Flavor = .mocha
    private var package: Packages = .glass
    private var isHot: Bool = false
    
    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date) {

        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, isContainMilk: isContainMilk, flavor: flavor, package: package, isHot: isHot)
    }
}
