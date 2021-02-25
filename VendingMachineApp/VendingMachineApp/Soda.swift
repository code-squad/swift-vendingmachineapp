//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Soda: Drink, CustomStringConvertible {
    private let calorie: Int
    
    init(manufacturer: String, volume: Int, name: String,
         dateOfManufacture: Date, price: Int, calorie: Int) {
        self.calorie = calorie
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price)
    }
}

