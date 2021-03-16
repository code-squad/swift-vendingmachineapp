//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Beverage : NSObject, NSCoding {
    private let brand : String
    private let amount : Int
    private let unit : Unit
    private let price : Int
    private let name : String
    private let manufactured : Date
    private let expiration : Date
    private let temperature : Int
    private let calorie : Int
    
    enum Unit : Int {
        case Liter
        case Milliliter
    }
    
    init(brand : String, amount : Int, unit : Unit, price : Int, name : String, manufactured : Date, expiration : Date, temperature : Int, calorie : Int) {
        self.brand = brand
        self.amount = amount
        self.unit = unit
        self.price = price
        self.name = name
        self.manufactured = manufactured
        self.expiration = expiration
        self.temperature = temperature
        self.calorie = calorie
    }
    
    required override init() {
        self.brand = ""
        self.amount = 0
        self.unit = Unit.Liter
        self.price = 0
        self.name = ""
        self.manufactured = Date()
        self.expiration = Date()
        self.temperature = 0
        self.calorie = 0
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(amount, forKey: "amount")
        coder.encode(unit.rawValue, forKey: "unit")
        coder.encode(price, forKey: "price")
        coder.encode(name, forKey: "name")
        coder.encode(manufactured, forKey: "manufactured")
        coder.encode(expiration, forKey: "expiration")
        coder.encode(temperature, forKey: "temperature")
        coder.encode(calorie, forKey: "calorie")
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: "brand") as! String
        self.amount = coder.decodeInteger(forKey: "amount")
        self.unit = Unit(rawValue: coder.decodeInteger(forKey: "unit"))!
        self.price = coder.decodeInteger(forKey: "price")
        self.name = coder.decodeObject(forKey: "name") as! String
        self.manufactured = coder.decodeObject(forKey: "manufactured") as! Date
        self.expiration = coder.decodeObject(forKey: "expiration") as! Date
        self.temperature = coder.decodeInteger(forKey: "temperature")
        self.calorie = coder.decodeInteger(forKey: "calorie")
    }
    
    override var description: String {
        return "\(brand), \(amount)\(unit), \(price)원, \(name), \(manufactured.description)"
    }
    
    func isPossiblePurchase(money : Int) -> Bool {
        return price <= money
    }
    
    func isExpiryDate(with date:Date) -> Bool {
        return expiration < date
    }
    
    func isHot(standard : Int) -> Bool {
        return temperature >= standard
    }
    
    func isLowCalorie(standard : Int) -> Bool {
        return calorie > standard
    }
    
    func decreaseBlance(money : Int) -> Int {
        return money - price
    }
}

extension Beverage {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price &&
            lhs.brand == rhs.brand && lhs.amount == rhs.amount &&
            lhs.unit == rhs.unit && lhs.calorie == rhs.calorie
    }
    
    override var hash: Int {
        var hasher = Hasher()
        hasher.combine(name)
        hasher.combine(price)
        return hasher.finalize()
    }
}
