//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Beverage {
    private let brand: String
    private let amount: Int
    private let price: Int
    private let name: String
    private let manufacturingDate: Date
    
    init(brand: String, amount: Int, price: Int, name: String) {
        self.brand = brand
        self.amount = amount
        self.price = price
        self.name = name
        self.manufacturingDate = Date()
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return "\(brand), \(amount)ml, \(price)원, \(name), \(formatter.string(from: manufacturingDate))"
    }
}
