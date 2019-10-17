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

class Beverage: NSObject, NSCoding {
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
    
    override var description: String {
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
    
    var itemImageName: String {
        return "img\(type(of: self))"
    }
    
    enum Keys: String {
        case brand = "Brand"
        case capacity = "Capacity"
        case price = "Price"
        case name = "Name"
        case dateOfManufactured = "DateOfManufactured"
        case temperature = "Temperature"
        case shelfLife = "ShelfLife"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: Keys.brand.rawValue)
        coder.encode(capacity, forKey: Keys.capacity.rawValue)
        coder.encode(price, forKey: Keys.price.rawValue)
        coder.encode(name, forKey: Keys.name.rawValue)
        coder.encode(dateOfManufactured, forKey: Keys.dateOfManufactured.rawValue)
        coder.encode(temperature, forKey: Keys.temperature.rawValue)
        coder.encode(shelfLife, forKey: Keys.shelfLife.rawValue)
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: Keys.brand.rawValue) as! String
        self.capacity = coder.decodeInteger(forKey: Keys.capacity.rawValue)
        self.price = coder.decodeInteger(forKey: Keys.price.rawValue)
        self.name = coder.decodeObject(forKey: Keys.name.rawValue) as! String
        self.dateOfManufactured = coder.decodeObject(forKey: Keys.dateOfManufactured.rawValue) as! Date
        self.temperature = coder.decodeInteger(forKey: Keys.temperature.rawValue)
        self.shelfLife = coder.decodeDouble(forKey: Keys.shelfLife.rawValue)
    }
}

extension Beverage {
    var objectID: ObjectIdentifier {
        let beverageType = type(of: self)
        let objectID = ObjectIdentifier(beverageType)
        return objectID
    }
}
