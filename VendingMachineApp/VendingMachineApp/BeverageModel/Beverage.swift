//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Beverage {
    private let brand: String
    private let size: Milli_Liter
    private let price: Int
    private let name: String
    private let packDate: Date
    
    public init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.packDate = packDate
    }
    
    public func isPurchasable(with money: Int) -> Bool {
        if self.price <= money {
            return true
        } else {
            return false
        }
    }
    
    public func checkPrice() -> Int {
        return self.price
    }
    
    public func isExpired() -> Bool {
        let oneDayInSeconds: Double = 86400
        let expiringDateFromPackDate: Double = 60
        return Date() > packDate.addingTimeInterval(oneDayInSeconds * expiringDateFromPackDate)
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(size)ml, \(price)원, \(name), \(packDate.useSimpleFormat(dateFormat:"yyyyMMdd"))"
    }
}

extension Beverage: Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand &&
            lhs.size == rhs.size &&
            lhs.price == rhs.price &&
            lhs.name == rhs.name &&
            lhs.packDate == rhs.packDate
    }
}
