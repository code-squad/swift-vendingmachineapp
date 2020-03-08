//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Beverage: CustomStringConvertible {
    private var manufacturer: String
    private var brand: String
    private var capacity: Int
    private(set) var price: Money
    private var name: String
    private var manufacturedDate: Date
    private var expirationDate: Date
    private var temperature: Int
    
    var description: String {
        return "\(manufacturer), \(capacity), \(price), \(brand), \(manufacturedDate.dateToString())"
    }

    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date, temperature: Int) {
        self.manufacturer = manufacturer
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
        self.expirationDate = expirationDate.setPastDate()
        self.temperature = temperature
    }
    
    func verifyHotBeverage() -> Bool {
        return temperature > 65 ? true : false 
    }
    
    func isExpiratedBeverage() -> Bool {
        let now = Date()
       return now > expirationDate ? true : false
    }
    
}


extension Beverage: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(capacity)
        hasher.combine(brand)
        hasher.combine(expirationDate)
        hasher.combine(temperature)
        hasher.combine(manufacturedDate)
        hasher.combine(manufacturer)
        hasher.combine(price)
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}
