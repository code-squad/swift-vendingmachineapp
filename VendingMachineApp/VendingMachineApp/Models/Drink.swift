//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Drink {
    private let manufacturer: String
    private let volume: Int
    private let name: String
    private let manufacturedAt: Date
    private lazy var expiredAt: Date = manufacturedAt 
    private(set) var price: Int
    private var temperature: Int
    var description: String {
        return "\(manufacturer), \(volume)ml, \(price)원, \(name), \(Date.dateFormatter(date: manufacturedAt))"
    }
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int, temperature: Int) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.name = name
        self.manufacturedAt = dateOfManufacture
        self.price = price
        self.temperature = temperature
    }
    
    func compare(with temperature: Int) -> Int {
        return self.temperature - temperature
    }
}

extension Drink: Drinkable {
    func validateManufacturedAt(with date: Date) -> Bool {
        return expiredAt <= date
    }
}

extension Drink: Hashable {
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.manufacturer == rhs.manufacturer && lhs.volume == rhs.volume && lhs.name == rhs.name && lhs.price == rhs.price
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(manufacturer)
    }
}
