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
    private(set) var calorie: Double
    private(set) var isHot: Bool
    private let manufacturingDate: Date
    private let expirationDate: Date
    
    init(brand: String, amount: Int, price: Int, name: String, calorie: Double, saleablePeriod: Int, isHot:Bool = false) {
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
        return calorie < 30
    }
    
    func validate(with date: Date) -> Bool {
        return date < expirationDate
    }
    
    func isPurchasable(money: Int) -> Bool {
        return money >= price
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
