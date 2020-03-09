//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Beverage {
    static let lowCalorieStandard = 30.0
    private let brand: String
    private let amount: Int
    private(set) var price: Money
    private(set) var name: String
    private(set) var calorie: Double
    private(set) var isHot: Bool
    private let manufacturingDate: Date
    private let expirationDate: Date
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, isHot:Bool = false) {
        self.brand = brand
        self.amount = amount
        self.price = price
        self.name = name
        self.calorie = calorie
        self.manufacturingDate = Date()
        self.expirationDate = Calendar.current.date(byAdding: .day, value: saleablePeriod, to: manufacturingDate)!
        self.isHot = isHot
    }
    
    func isLowCalorie() -> Bool {
        return calorie < Beverage.lowCalorieStandard
    }
    
    func validate(with date: Date) -> Bool {
        return date < expirationDate
    }
}

extension Beverage: CustomStringConvertible, Hashable, Comparable {
    static func < (lhs: Beverage, rhs: Beverage) -> Bool {
        lhs.name < rhs.name
    }
    
    var description: String {
        "\(brand), \(amount)ml, \(price)원, \(name), \(manufacturingDate.formattedDate)"
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        lhs.brand == rhs.brand && lhs.name == rhs.name 
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.brand)
        hasher.combine(self.name)
    }
}

extension Date {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: self)
    }
}
