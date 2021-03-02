//
//  SoftDrink.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class SoftDrink: Beverage {
    
    private let package: Packages
    
    enum Packages: String {
        case glass = "glass"
        case can = "can"
        case plastic = "plastic"
    }

    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, package: Packages) {
        self.package = package
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
}
