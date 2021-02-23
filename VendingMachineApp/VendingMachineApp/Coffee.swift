//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Coffee: Drink, CustomStringConvertible {
    enum Brand {
        case top, cantata, georgia
    }
    
    private(set) var brand: Brand
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int, brand: Brand) {
        self.brand = brand
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price)
    }
}
