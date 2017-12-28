//
//  Beverage.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    private let brand: String
    private let weight: Int
    let price: Int
    private let name: String
    private let dateOfManufacture: Date

    init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
    }

    var description: String {
        return "\(brand), \(weight)ml, \(price)원, \(name), \(dateOfManufacture.getStringFromDate())"
    }

    func isBuyable(with: Int) -> Bool {
        return with >= price
    }

}

extension Beverage: Equatable {

    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.description == rhs.description
    }

}
