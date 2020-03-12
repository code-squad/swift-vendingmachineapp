//
//  Drink.swift
//  VendingMachineApp
//
//  Created by 임승혁 on 2020/03/11.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Drink {
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let manufacturingDate: Date
    private let expiryDate: Date
    private let dateFormatter = DateFormatter()
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturingDate: String, expiryDate: String) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        
        dateFormatter.dateFormat = "yyyyMMdd"
        self.manufacturingDate = dateFormatter.date(from: manufacturingDate)!
        self.expiryDate = dateFormatter.date(from: expiryDate)!
    }
}

extension Drink: CustomStringConvertible {
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(dateFormatter.string(from:manufacturingDate))"
    }
}
