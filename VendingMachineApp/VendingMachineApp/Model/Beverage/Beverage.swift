//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Beverage {
    private var brand: String
    private var capacity: Double
    private(set) var price: Price
    private var name: String
    private var manufacturingDate: Date
    private var expirationDate: Date
    private var calorie: Double
    private var temperature: Double
    
    init(brand: String, capacity: Double, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Double) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
        self.expirationDate = Date(timeInterval: 86400 * 14, since: manufacturingDate)
        self.calorie = calorie
        self.temperature = temperature
    }
    
    func canBuy(have balance: Int) -> Bool {
        return price.isCheaper(than: Price(balance))
    }
    
    func isSafe() -> Bool {
        return expirationDate > Date()
    }
    
    func isHot(standard: Double) -> Bool {
        return temperature >= standard
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(name)"
    }
}

extension Beverage: Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return (lhs.brand == rhs.brand) && (lhs.name == rhs.name) && (lhs.capacity == rhs.capacity)
    }
}
