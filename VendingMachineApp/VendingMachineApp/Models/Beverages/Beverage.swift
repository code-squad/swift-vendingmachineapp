//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Beverage: Hashable {
    private let brand: String
    private let name: String
    private let volume: Int
    let manufacturingDate: Date
    let price: Money
    
    init(
        brand: String,
        name: String,
        volume: Int,
        price: Int
    ) {
        self.brand = brand
        self.name = name
        self.volume = volume
        self.price = Money(balance: price)
        self.manufacturingDate = Date()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(name)
        hasher.combine(volume)
        hasher.combine(price)
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}


extension Beverage: CustomStringConvertible {
    @objc var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name)" +
        ", \(manufacturingDate.toStringYearMonthDay)"
    }
}
