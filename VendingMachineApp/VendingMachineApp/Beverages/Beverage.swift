//
//  Beverage.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct BeverageStandard {
    static let calorie = 50
    static let temperature = 60
    static let calcium = 2
}

class Beverage: CustomStringConvertible {
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let dateOfManufactured: Date
    private let temperature: Int
    private let shelfLife: Double
    
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufactured: Date, temperature: Int, shelfLife: Double) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.dateOfManufactured = dateOfManufactured
        self.temperature = temperature
        self.shelfLife = TimeInterval(SecondOfDay.second) * 7
    }
    
    var description: String {
        return "\(type(of: self)) - \(brand), \(capacity)ml, \(price)원, \(name), \(dateOfManufactured.convertToString())"
    }
    
    var isHot: Bool {
        return temperature > BeverageStandard.temperature
    }
    
    var isExpired: Bool {
        return dateOfManufactured + shelfLife < Date()
    }
    
    var itemName: String {
        return name
    }
    
    var itemPrice: Int {
        return price
    }
    
    func showBeverage(with show: (String, Int) -> Void) {
        show(name, price)
    }
}

extension Beverage: Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Beverage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

extension Beverage {
    var objectID: ObjectIdentifier {
        let beverageType = type(of: self)
        let objectID = ObjectIdentifier(beverageType)
        return objectID
    }
}
