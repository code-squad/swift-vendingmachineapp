//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Milk: Drink, CustomStringConvertible {
    private let farmCode: String
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int, farmCode: String, temperature: Int) {
        self.farmCode = farmCode
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price, temperature: temperature)
    }
}
