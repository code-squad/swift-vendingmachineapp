//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Beverage {
    private let brand: String
    private let size: Milliliter
    private let price: Int
    public let name: String
    private let packageTime: Date
    
    public init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.packageTime = packageTime
    }
    
    public func isPurchasable(with money: Int) -> Bool {
        return self.price <= money
    }
    
    public func showPrice() -> Int {
        return self.price
    }
    
    public func isExpired() -> Bool {
        return self.packageTime.isOld(after: 60)
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        let simpleDateFormat = "yyyyMMdd"
        return "\(brand), \(size)ml, \(price)원, \(name), \(packageTime.useSimpleFormat(dateFormat: simpleDateFormat))"
    }
}

extension Beverage: Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand &&
            lhs.size == rhs.size &&
            lhs.price == rhs.price &&
            lhs.name == rhs.name &&
            lhs.packageTime == rhs.packageTime
    }
}

extension Beverage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(size)
        hasher.combine(price)
        hasher.combine(name)
        hasher.combine(packageTime)
    }
}
