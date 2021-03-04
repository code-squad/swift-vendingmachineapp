//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/25.
//

import Foundation

class Beverage: CustomStringConvertible, Beveragable  {
    
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufacturedAt.description)"
    }
    
    private var brand: String
    private var volume: Int
    private(set) var price: Int
    private var name: String
    private var manufacturedAt: Date
    private var temperature: Double
    private var expirationDate: Date
    private var calory: Int
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temperature: Double, expirationDate: Date, calory: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedAt = manufacturedAt
        self.temperature = temperature
        self.expirationDate = expirationDate
        self.calory = calory
    }
    
    func availableBeverage(currentAmount: Int) -> Bool {
        return price <= currentAmount
    }
    
    func isExpired(with date: Date) -> Bool {
        return expirationDate < date
    }
    
    func isHot() -> Bool {
        return temperature >= 65.0
    }
    
    func isLowCalorie() -> Bool {
        return calory < 50
    }
}
extension Beverage {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool{
        return (lhs.brand == rhs.brand) && (lhs.volume == rhs.volume) && (lhs.price) == (rhs.price) && (lhs.name) == (rhs.name) && (lhs.manufacturedAt == rhs.manufacturedAt) && (lhs.temperature == rhs.temperature) && (lhs.expirationDate == rhs.expirationDate) && (lhs.calory == rhs.calory)
    }
}
