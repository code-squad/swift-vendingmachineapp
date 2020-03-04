//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Beverage: CustomStringConvertible {
    private var manufacturer: String
    private var brand: String
    private var capacity: Int
    private(set) var price: Int
    private var name: String
    private(set) var manufacturedDate: Date
    private(set) var expirationDate: Date
    private var isHot: Bool
    
    var description: String {
        return "\(manufacturer), \(capacity), \(price), \(brand), \(dateToString(manufacturedDate))"
    }

    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date, isHot: Bool) {
        self.manufacturer = manufacturer
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
        self.expirationDate = expirationDate
        self.isHot = isHot
    }
    
    func dateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
    }
    
    func stringToDate(_ date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        return dateFormatter.date(from: date)!
    }
    
    func verifyHotBeverage() -> Bool {
        return isHot
    }
}

extension Beverage: Equatable {

    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand
            && lhs.capacity == rhs.capacity
            && lhs.expirationDate == rhs.expirationDate
            && lhs.isHot == rhs.isHot
            && lhs.manufacturedDate == rhs.manufacturedDate
            && lhs.manufacturer == rhs.manufacturer
            && lhs.name == rhs.name
            && lhs.price == rhs.price
    }
    
}
