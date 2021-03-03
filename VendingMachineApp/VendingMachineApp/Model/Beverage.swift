//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufacture.anotherDescription)"
    }
    
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var manufacture: Date
    private var expirationDate: Date
    private var temperature: Double
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, expirationDate: Date, temperature: Double) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacture = manufacture
        self.expirationDate = expirationDate
        self.temperature = temperature
    }
    
    func isAvailablePurchase(with cash: Int) -> Bool{
        return self.price <= cash
    }
    func calculateChange(with cash: Int) -> Int {
        return cash - self.price
    }
    func isExpired(on standard: Date) -> Bool {
        return self.expirationDate < standard
    }
    func isHot(at standard: Double) -> Bool {
        return self.temperature >= standard
    }
}

extension Beverage: Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.description == rhs.description
    }
}

extension Beverage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(capacity)
        hasher.combine(price)
        hasher.combine(name)
        hasher.combine(manufacture)
    }
}
