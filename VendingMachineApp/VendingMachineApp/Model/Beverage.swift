//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Beverage: NSObject, NSCoding {
    override var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufacturedAt.anotherDescription)"
    }
    
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var manufacturedAt: Date
    private var expirationAt: Date
    private var temperature: Double
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(capacity, forKey: "capacity")
        coder.encode(price, forKey: "price")
        coder.encode(name, forKey: "name")
        coder.encode(manufacturedAt, forKey: "manufacturedAt")
        coder.encode(expirationAt, forKey: "expirationAt")
        coder.encode(temperature, forKey: "temperature")
    }
    
    required init?(coder: NSCoder) {
        brand = coder.decodeObject(forKey: "brand") as! String
        capacity = coder.decodeInteger(forKey: "capacity")
        price = coder.decodeInteger(forKey: "price")
        name = coder.decodeObject(forKey: "name") as! String
        manufacturedAt = coder.decodeObject(forKey: "manufacturedAt") as! Date
        expirationAt = coder.decodeObject(forKey: "expirationAt") as! Date
        temperature = coder.decodeDouble(forKey: "temperature")
    }
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date, expirationAt: Date, temperature: Double) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedAt = manufacturedAt
        self.expirationAt = expirationAt
        self.temperature = temperature
    }
    
    func isAvailablePurchase(with cash: Int) -> Bool {
        return self.price <= cash
    }
    
    func calculateChange(with cash: Int) -> Int {
        return cash - self.price
    }
    
    func isExpired(on standard: Date) -> Bool {
        return self.expirationAt < standard
    }
    
    func isHot(at standard: Double) -> Bool {
        return self.temperature >= standard
    }
}
