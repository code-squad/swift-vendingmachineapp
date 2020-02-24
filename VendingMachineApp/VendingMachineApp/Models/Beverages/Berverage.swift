//
//  Berverage.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Beverage: Hashable {
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
    
    let name: String
    let brand: String
    let servingSize: Int
    let price: Money
    let dateOfManufacture: Date
    
    init(name: String, brand: String, servingSize: Int, price: Money, dateOfManufacture: Date) {
        self.name = name
        self.brand = brand
        self.servingSize = servingSize
        self.price = price
        self.dateOfManufacture = dateOfManufacture
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(name), \(servingSize)ml, \(price)원"
    }
}
