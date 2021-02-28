//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Soda: Drink, CustomStringConvertible {
    
    init(manufacturer: String, volume: Int, name: String,
         dateOfManufacture: Date, price: Int, calorie: Int, temperature: Int) {
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price, temperature: temperature, calorie: calorie)
    }
}

