//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Beverage: SafeDateChecker {

    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufacturedAt.toString()), \(expiredAt.toString())"
    }
    
    private var brand: String
    private var capacity: Int
    private(set) var price: Int
    private var name: String
    private var manufacturedAt: Date
    private var expiredAt: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, expiredAt: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedAt = manufacture
        self.expiredAt = expiredAt
    }
    
    public func isExpired() -> Bool {
        return expiredAt <= manufacturedAt
    }
    
    public func canSell(to buyer: PaymentManager) -> Bool {
        price <= buyer.money
    }
}

protocol Hotable {
    func isHot() -> Bool
}

protocol SafeDateChecker {
    func isExpired() -> Bool
}

protocol LowCalorieChecker {
    func isLowCalorie() -> Bool
}

extension Beverage: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(capacity)
        hasher.combine(price)
        hasher.combine(name)
        hasher.combine(brand)
    }
 
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name &&
            lhs.capacity == rhs.capacity &&
            lhs.brand == rhs.brand &&
            lhs.price == rhs.price
    }
}
