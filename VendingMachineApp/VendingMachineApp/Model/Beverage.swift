//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Beverage: CustomStringConvertible {
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var openDate: Date
    var description: String {
        return "\(brand), \(capacity), \(price), \(name), \(openDate)"
    }

    init(brand: String, capacity: Int, price: Int, name: String, openDate: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.openDate = openDate
    }
    
}
