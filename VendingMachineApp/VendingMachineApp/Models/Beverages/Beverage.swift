//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Hashable {
    let manufacturer: String
    let size: Int
    let price: Int
    let name: String
    let productionDate: Date
    
    var description: String {
        return """
        \(manufacturer), \(size), \(price), \(name), \(productionDate.stockDisplayingFormat)
        """
    }
    
    init(manufacturer: String, size: Int, price: Int, name: String) {
        self.manufacturer = manufacturer
        self.size = size
        self.price = price
        self.name = name
        self.productionDate = Date()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(manufacturer)
        hasher.combine(size)
        hasher.combine(price)
        hasher.combine(name)
    }
    
    func isEqual(to rhs: Beverage) -> Bool {
        return hashValue == rhs.hashValue
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

extension Date {
    static let productionDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var stockDisplayingFormat: String {
        return Self.productionDateFormatter.string(from: self)
    }
}
