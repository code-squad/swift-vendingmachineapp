//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    let manufacturer: String
    let size: Int
    let price: Int
    let productionDate: Date
    
    var description: String {
        return "\(manufacturer), \(size), \(price)"
    }
    
    init(manufacturer: String, size: Int, price: Int) {
        self.manufacturer = manufacturer
        self.size = size
        self.price = price
        self.productionDate = Date()
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
