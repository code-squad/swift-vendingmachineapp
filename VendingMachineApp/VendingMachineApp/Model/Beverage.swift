//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufacturedAt.anotherDescription)"
    }
    
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var manufacturedAt: Date
    private var expirationAt: Date
    private var temperature: Double
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date, expirationAt: Date, temperature: Double) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedAt = manufacturedAt
        self.expirationAt = expirationAt
        self.temperature = temperature
    }
    
    func isAvailablePurchase(with cash: Int) -> Bool {
        return self.price <= cash
    }
    
    func calculateChange(with cash: Int) -> Int {
        return cash - self.price
    }
    
    func isExpired(on standard: Date) -> Bool {
        return self.expirationAt < standard
    }
    
    func isHot(at standard: Double) -> Bool {
        return self.temperature >= standard
    }
}

extension Beverage: Hashable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand && lhs.capacity == rhs.capacity && lhs.price == rhs.price && lhs.name == rhs.name && lhs.manufacturedAt == rhs.manufacturedAt && lhs.expirationAt == rhs.expirationAt && lhs.temperature == rhs.temperature
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(capacity)
        hasher.combine(price)
        hasher.combine(name)
        hasher.combine(manufacturedAt)
        hasher.combine(expirationAt)
        hasher.combine(temperature)
    }
}
