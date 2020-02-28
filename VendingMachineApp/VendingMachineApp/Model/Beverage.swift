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
    private var price: Int
    private var name: String
    private var manufacturedDate: Date
    var description: String {
        return "\(manufacturer), \(capacity), \(price), \(brand), \(manufacturedDate)"
    }

    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date) {
        self.manufacturer = manufacturer
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
    }
    
}
