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
    private var flavor: Int
    private var isLactoFree: Bool

    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, fatRatio: FatRatio, flavor: Int, isLactoFree: Bool) {
        self.fatRatio = fatRatio
        self.flavor = flavor
        self.isLactoFree = isLactoFree
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate)
    }
    
    enum FatRatio {
        case original
        case lower
        case free
    }
    
}
