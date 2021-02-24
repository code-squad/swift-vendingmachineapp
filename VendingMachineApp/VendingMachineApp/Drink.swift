//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Drink: Hashable {
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.dateOfManufacture == rhs.dateOfManufacture && lhs.manufacturer == rhs.manufacturer
            && lhs.volume == rhs.volume && lhs.name == rhs.name && lhs.price == rhs.price
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(manufacturer)
        hasher.combine(volume)
        hasher.combine(name)
        hasher.combine(dateOfManufacture)
        hasher.combine(price)
    }
    
    private var manufacturer: String
    private var volume: Int
    private var name: String
    private var dateOfManufacture: Date
    private(set) var price: Int
    var description: String {
        return "\(manufacturer), \(volume)ml, \(price)원, \(name), \(Date.dateFormatter(date: dateOfManufacture))"
    }
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.name = name
        self.dateOfManufacture = dateOfManufacture
        self.price = price
    }
}
