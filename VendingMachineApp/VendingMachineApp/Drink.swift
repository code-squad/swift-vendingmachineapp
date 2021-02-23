//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Drink {
    private var manufacturer: String
    private var volume: Int
    private var name: String
    private var dateOfManufacture: Date
    private var price: Int
    var description: String {
        return "\(manufacturer), \(volume)ml, \(price)원, \(name), \(Utility.dateFormatter(date: dateOfManufacture))"
    }
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.name = name
        self.dateOfManufacture = dateOfManufacture
        self.price = price
    }
}
