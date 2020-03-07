//
//  Mocha.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Mocha: Coffee {
    private var isContainWheepCream: Bool
    
    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date, isContainMilk: Bool, package: Packages, temperature: Int, isContainWheepCream: Bool) {
        self.isContainWheepCream = isContainWheepCream
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, package: package, temperature: temperature)
        
    }
}
