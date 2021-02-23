//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Milk: Drinkable, CustomStringConvertible {
    var manufacturer: String
    var volume: Int
    var brand: String
    var dateOfManufacture: Date
    var price: Int
    var description: String {
        return "\(manufacturer), \(volume)ml, \(price)원, \(brand), \(Utility.dateFormatter(date: dateOfManufacture))"
    }
    
    init(manufacturer: String, volume: Int, brand: String, dateOfManufacture: Date, price: Int) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.brand = brand
        self.dateOfManufacture = dateOfManufacture
        self.price = price
    }
}
