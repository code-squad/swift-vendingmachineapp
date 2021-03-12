//
//  Beverage.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class Beverage: NSObject, NSCoding{
    private var manufacturer: String
    private var volume: Int
    private(set) var price: Int
    private var brand: String
    private var manufactured: Date
    private var expiry: Date
    private var calorie: Int
    private var temperature: Int
    
    required init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.price = price
        self.brand = brand
        self.manufactured = manufactured
        self.expiry = expiry
        self.calorie = calorie
        self.temperature = temperature
    }
    
    required init?(coder: NSCoder) {
        self.manufacturer = coder.decodeObject(forKey: "manufacturer") as! String
        self.volume = coder.decodeInteger(forKey: "volume")
        self.price = coder.decodeInteger(forKey: "price")
        self.brand = coder.decodeObject(forKey: "brand") as! String
        self.manufactured = coder.decodeObject(forKey: "manufactured") as! Date
        self.expiry = coder.decodeObject(forKey: "expiry") as! Date
        self.calorie = coder.decodeInteger(forKey: "calorie") as! Int
        self.temperature = coder.decodeInteger(forKey: "temperature") as! Int
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(manufacturer, forKey: "manufacturer")
        coder.encode(volume, forKey: "volume")
        coder.encode(price, forKey: "price")
        coder.encode(brand, forKey: "brand")
        coder.encode(manufactured, forKey: "manufactured")
        coder.encode(expiry, forKey: "expiry")
        coder.encode(calorie, forKey: "calorie")
        coder.encode(temperature, forKey: "temperature")
    }
    
    override var description: String {
        return "Beverage(\(manufacturer)), (\(volume)ml), (\(price)원), (\(brand)), (\(manufactured.description))"
    }
    
    func isLowCalorie(with compare: Int) -> Bool {
        return self.calorie <= compare
    }
    
    func isHot(with compare: Int) -> Bool {
        return self.temperature >= compare
    }
    
    func validateExpiryTime(with date: Date) -> Bool {
        return expiry >= date
    }
    
    func isAvailablePurchase(with money: Money) -> Bool {
        return money.compare(with: price)
    }
}

//extension Beverage: Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.brand)
//    }
//    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
//        return lhs.brand == rhs.brand
//    }
//}
