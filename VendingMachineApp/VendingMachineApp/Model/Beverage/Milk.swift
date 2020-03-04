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
    private var flavor: Flavor
    private var isLactoFree: Bool

    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date, fatRatio: FatRatio, flavor: Flavor, isLactoFree: Bool) {
        self.fatRatio = fatRatio
        self.flavor = flavor
        self.isLactoFree = isLactoFree
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate)
    }
    
    enum Flavor {
        case normal
        case banana
        case choco
        case strawberry
    }
    
    enum FatRatio {
        case original
        case lower
        case free
    }
    
}
