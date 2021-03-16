//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/25.
//

import Foundation

class Beverage: NSObject, NSCoding {
    
    override var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufacturedAt.description)"
    }
    
    private var brand: String
    private var volume: Int
    private(set) var price: Int
    private var name: String
    private var manufacturedAt: Date
    private var temperature: Double
    private var expiredAt: Date
    private var calory: Int
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temperature: Double, expiredAt: Date, calory: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedAt = manufacturedAt
        self.temperature = temperature
        self.expiredAt = expiredAt
        self.calory = calory
    }
    
    //MARK: encode 메소드, required init
    func encode(with coder: NSCoder) {
        coder.encode(self.brand, forKey: "brand")
        coder.encode(self.volume, forKey: "volume")
        coder.encode(self.price, forKey: "price")
        coder.encode(self.name, forKey: "name")
        coder.encode(self.manufacturedAt, forKey: "manufacturedAt")
        coder.encode(self.temperature, forKey: "temperature")
        coder.encode(self.expiredAt, forKey: "expiredAt")
        coder.encode(self.calory, forKey: "calory")
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: "brand") as! String
        self.volume = coder.decodeInteger(forKey: "volume")
        self.price = coder.decodeInteger(forKey: "price")
        self.name = coder.decodeObject(forKey: "name") as! String
        self.manufacturedAt = coder.decodeObject(forKey: "manufacturedAt") as! Date
        self.temperature = coder.decodeDouble(forKey: "temperature")
        self.expiredAt = coder.decodeObject(forKey: "expiredAt") as! Date
        self.calory = coder.decodeInteger(forKey: "calory")
    }
    
    func availableBeverage(currentAmount: Int) -> Bool {
        return price <= currentAmount
    }
    
    func isExpired(with date: Date) -> Bool {
        return expiredAt < date
    }
    
    func isHot(referenceTemperature: Double) -> Bool {
        return temperature >= referenceTemperature
    }
    
    func isLowCalorie(referenceCalory: Int) -> Bool {
        return calory < referenceCalory
    }
}

