//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Beverage: CustomStringConvertible, Hashable {
    private let brand: String
    private let volume: Int
    let price: Int
    private let name: String
    private let createdAt: Date
    private let expiredAt: Date
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return type(of: lhs) == type(of: rhs)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(type(of: self)))
    }
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.createdAt = createdAt
        self.expiredAt = expiredAt
    }
    
    convenience init() {
        self.init(brand: "brand", volume: 0, price: 0, name: "name", createdAt: Date(), expiredAt: Date())
    }
    
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(DateConverter.format(from: createdAt))"
    }
    
    func isExpired(current: Date) -> Bool {
        return expiredAt < current
    }
}


