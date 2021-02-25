//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(dateOfManufacture.anotherDescription)"
    }
    
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var dateOfManufacture: Date
    init(brand: String, capacity: Int, price: Int, name: String, date: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.dateOfManufacture = date
    }

}
