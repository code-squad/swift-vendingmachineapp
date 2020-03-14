//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Beverage: NSObject, NSCoding {
    enum Property: String, CustomStringConvertible {
        case brand
        case capacity
        case price
        case name
        case manufactureingDate
        case expirationDate
        case calorie
        case temperature
        
        var description: String {
            return self.rawValue
        }
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "\(Property.brand)")
        coder.encode(capacity, forKey: "\(Property.capacity)")
        coder.encode(price, forKey: "\(Property.price)")
        coder.encode(name, forKey: "\(Property.name)")
        coder.encode(manufacturingDate, forKey: "\(Property.manufactureingDate)")
        coder.encode(expirationDate, forKey: "\(Property.expirationDate)")
        coder.encode(calorie, forKey: "\(Property.calorie)")
        coder.encode(temperature.rawValue, forKey: "\(Property.temperature)")
    }
    
    required init?(coder decoder: NSCoder) {
        if let brand = decoder.decodeObject(forKey: "\(Property.brand)") as? String {
            self.brand = brand
        } else {
            self.brand = ""
        }
        
        self.capacity = decoder.decodeInteger(forKey: "\(Property.capacity)")
        
        if let price = decoder.decodeObject(forKey: "\(Property.price)") as? Price {
            self.price = price
        } else {
            self.price = Price(0)
        }
        
        if let name = decoder.decodeObject(forKey: "\(Property.name)") as? String {
            self.name = name
        } else {
            self.name = ""
        }
        
        if let manufacturingDate = decoder.decodeObject(forKey: "\(Property.manufactureingDate)") as? Date {
            self.manufacturingDate = manufacturingDate
        } else {
            self.manufacturingDate = Date()
        }
        
        if let expirationDate = decoder.decodeObject(forKey: "\(Property.expirationDate)") as? Date {
            self.expirationDate = expirationDate
        } else {
            self.expirationDate = Date()
        }
        
        self.calorie = decoder.decodeDouble(forKey: "\(Property.calorie)")
        
        let temperature = decoder.decodeDouble(forKey: "\(Property.temperature)")
        self.temperature = Temperature.init(rawValue: temperature)!
    }
    
    enum Temperature: Double, Comparable {
        static func < (lhs: Beverage.Temperature, rhs: Beverage.Temperature) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
        
        case Cool = 10.0
        case Hot = 65.0
        
        func isHot() -> Bool {
            return self >= Temperature.Hot
        }
    }
    
    private var brand: String
    private var capacity: Int
    private(set) var price: Price
    private var name: String
    private var manufacturingDate: Date
    private var expirationDate: Date
    private var calorie: Double
    private var temperature: Temperature
    
    override var description: String {
        return name
    }
    
    init(brand: String, capacity: Int, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Temperature) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
        self.expirationDate = Date().expiredDay(from: manufacturingDate, days: 14)
        self.calorie = calorie
        self.temperature = temperature
    }
    
    func canBuy(have balance: Price) -> Bool {
        return price.isCheaper(than: Price("\(balance)"))
    }
    
    func isSafe() -> Bool {
        return expirationDate > Date()
    }
    
    func isHot() -> Bool {
        return temperature.isHot()
    }
}

extension Date {
    func expiredDay(from: Date, days: Double) -> Date{
        return Date(timeInterval: 86400 * days, since: from)
    }
}
