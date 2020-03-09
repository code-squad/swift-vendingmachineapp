//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Beverage {
    enum Temperature: Double {
        case Cool = 10.0
        case Hot = 65.0
        
        func isHot() -> Bool {
            return self == Temperature.Hot
        }
    }
    
    private var brand: String
    private var capacity: Int
    private(set) var price: Price
    private var name: String
    private var manufacturingDate: Date
    private var expirationDate: Date
    private var calorie: Double
    private var temperature: Temperature
    
    init(brand: String, capacity: Int, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Temperature) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
        self.expirationDate = Date().expiredDay(from: manufacturingDate, period: 14)
        self.calorie = calorie
        self.temperature = temperature
    }
    
    func canBuy(have balance: Int) -> Bool {
        return price.isCheaper(than: Price(balance))
    }
    
    func isSafe() -> Bool {
        return expirationDate > Date()
    }
    
    func isHot() -> Bool {
        return temperature.isHot()
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

extension Date {
    func expiredDay(from: Date, period: Double) -> Date{
        return Date(timeInterval: 86400 * period, since: from)
    }
}
