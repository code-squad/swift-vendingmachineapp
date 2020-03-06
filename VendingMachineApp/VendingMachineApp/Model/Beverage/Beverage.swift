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
    private var manufacturedDate: Date
    private var expirationDate: Date
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

    func verifyHotBeverage() -> Bool {
        return isHot
    }
    
    func isExpiratedBeverage() -> Bool {
       return manufacturedDate > expirationDate ? true : false
    }
    
}


extension Beverage: Equatable, Hashable{
    var hashValue: Int {
        return capacity.hashValue ^ brand.hashValue ^ expirationDate.hashValue ^ isHot.hashValue ^ manufacturedDate.hashValue ^ manufacturer.hashValue ^ price.hashValue
    }
    
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
