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
    private let calorie: Double
    private let manufacturingDate: Date
    
    init(brand: String, amount: Int, price: Int, name: String, calorie: Double) {
        self.brand = brand
        self.amount = amount
        self.price = price
        self.name = name
        self.calorie = calorie
        self.manufacturingDate = Date()
    }
    func isLowCalorie() -> Bool {
        return calorie < 30
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        "\(brand), \(amount)ml, \(price)원, \(name), \(manufacturingDate.formattedDate)"
    }
}

extension Date {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: self)
    }
}
