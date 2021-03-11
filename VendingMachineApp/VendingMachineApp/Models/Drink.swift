//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Drink: NSObject, NSCoding {
    private let manufacturer: String
    private let volume: Int
    private let name: String
    private let manufacturedAt: Date
    private let expiredAt: Date
    private(set) var price: Int
    private var temperature: Int
    private var calorie: Int
    override var description: String {
        return "\(manufacturer), \(volume)ml, \(price)원, \(name), \(Date.dateFormatter(date: manufacturedAt))"
    }
    
    init(manufacturer: String, volume: Int, name: String, manufacturedAt: Date, price: Int, temperature: Int, calorie: Int, expiredAt: Date) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.name = name
        self.manufacturedAt = manufacturedAt
        self.price = price
        self.temperature = temperature
        self.calorie = calorie
        self.expiredAt = expiredAt
    }
    
    required init?(coder: NSCoder) {
        self.manufacturer = coder.decodeObject(forKey: "manufacturer") as! String
        self.volume = coder.decodeInteger(forKey: "volume")
        self.name = coder.decodeObject(forKey: "name") as! String
        self.manufacturedAt = coder.decodeObject(forKey: "manufacturedAt") as! Date
        self.expiredAt = coder.decodeObject(forKey: "expiredAt") as! Date
        self.price = coder.decodeInteger(forKey: "price")
        self.temperature = coder.decodeInteger(forKey: "temperature")
        self.calorie = coder.decodeInteger(forKey: "calorie")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(manufacturer, forKey: "manufacturer")
        coder.encode(volume, forKey: "volume")
        coder.encode(name, forKey: "name")
        coder.encode(manufacturedAt, forKey: "manufacturedAt")
        coder.encode(expiredAt, forKey: "expiredAt")
        coder.encode(price, forKey: "price")
        coder.encode(temperature, forKey: "temperature")
        coder.encode(calorie, forKey: "calorie")
    }
}

extension Drink: Drinkable {
    func validateExpiredAt(with date: Date) -> Bool {
        return expiredAt <= date
    }
    
    func isHot(with temperature: Int) -> Bool {
        return self.temperature > temperature
    }
    
    func isLowCalorie(with calorie: Int) -> Bool {
        return self.calorie > calorie
    }
}
