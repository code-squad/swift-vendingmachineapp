//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/25.
//

import Foundation

class Beverage: CustomStringConvertible {
    
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufacturedAt.description)"
    }
    
    private var brand: String
    private var volume: Int
    private(set) var price: Int
    private var name: String
    private var manufacturedAt: Date
    private var temperature: Double
    private var expiredAt: Date
    private var calory: Int
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temperature: Double, expiredAt: Date, calory: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedAt = manufacturedAt
        self.temperature = temperature
        self.expiredAt = expiredAt
        self.calory = calory
    }
    
    func availableBeverage(currentAmount: Int) -> Bool {
        return price <= currentAmount
    }
    
    func isExpired(with date: Date) -> Bool {
        return expiredAt < date
    }
    
    func isHot(referenceTemperature: Double) -> Bool {
        return temperature >= referenceTemperature
    }
    
    func isLowCalorie(referenceCalory: Int) -> Bool {
        return calory < referenceCalory
    }
}
extension Beverage: Hashable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool{
        return ObjectIdentifier(type(of: lhs)) == ObjectIdentifier(type(of: rhs))
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(volume)
        hasher.combine(price)
        hasher.combine(name)
        hasher.combine(manufacturedAt)
    }
}
