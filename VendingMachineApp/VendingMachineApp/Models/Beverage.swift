//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/25.
//

import Foundation

class Beverage: CustomStringConvertible {
    
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let manufactureDate: Date
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufactureDate.productDisplayFormat)"
    }
    
    init(brand: String, capacity: Int, price: Int, name: String, dateString: String){
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufactureDate = dateString.converToDate()
    }
}

extension String {
    func converToDate() -> Date {
        let manufactureDateFormatter = DateFormatter()
        manufactureDateFormatter.dateFormat = "yyyyMMdd"
        return manufactureDateFormatter.date(from: self)!
    }
}

extension Date {
    var productDisplayFormat: String {
        let manufactureDateFormatter = DateFormatter()
        manufactureDateFormatter.dateFormat = "yyyyMMdd"
        return manufactureDateFormatter.string(from: self)
    }
}
