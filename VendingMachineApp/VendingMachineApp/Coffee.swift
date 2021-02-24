//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Coffee: Drink, CustomStringConvertible {
    private var caffeineContent: Int
    
    init(manufacturer: String, volume: Int, name: String,
         dateOfManufacture: Date, price: Int, caffeineContent: Int) {
        self.caffeineContent = caffeineContent
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price)
    }
}
