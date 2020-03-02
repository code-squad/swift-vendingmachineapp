//
//  Berverage.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Beverage {
    let name: String
    let brand: String
    let servingSize: Int
    let price: Money
    let manufactureDate: Date
    let expirationDate: Date
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date) {
        self.name = name
        self.brand = brand
        self.servingSize = servingSize
        self.price = price
        self.manufactureDate = manufactureDate
        self.expirationDate = expirationDate
    }
    
    func isPurchasable(with balance: Money) -> Bool {
        return price >= balance
    }
    
    func validate(with date: Date) -> Bool {
        return Date() < expirationDate
    }
    
    func objectIdentifier() -> ObjectIdentifier {
        return ObjectIdentifier(type(of: self))
    }
}

extension Beverage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        guard lhs.name == rhs.name else { return false }
        guard lhs.brand == rhs.brand else { return false }
        guard lhs.servingSize == rhs.servingSize else { return false }
        guard lhs.price == rhs.price else { return false }
        return true
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(name), \(servingSize)ml, \(price)원, 제조일자: \(manufactureDate.dateFormatString())"
    }
}
