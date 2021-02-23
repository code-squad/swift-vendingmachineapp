//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Milk: Drink, CustomStringConvertible {
    enum Flavor {
        case straberry, banana, choco
    }
    
    private(set) var flavor: Flavor
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int, flavor: Flavor) {
        self.flavor = flavor
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price)
    }
}
