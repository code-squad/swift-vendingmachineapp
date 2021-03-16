//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Beverage: NSObject, SafeDateChecker, NSCoding {
   
    override var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufacturedAt.toString()), \(expiredAt.toString())"
    }
    
    private var brand: String
    private var capacity: Int
    private(set) var price: Int
    private(set) var name: String
    private var manufacturedAt: Date
    private var expiredAt: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, expiredAt: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedAt = manufacture
        self.expiredAt = expiredAt
    }
    
    required override init() {
        self.brand = "unknown"
        self.capacity = 0
        self.price = 0
        self.name = "unknown"
        self.manufacturedAt = Date()
        self.expiredAt = Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(capacity, forKey: "capacity")
        coder.encode(price, forKey: "price")
        coder.encode(name, forKey: "name")
        coder.encode(manufacturedAt, forKey: "manufacturedAt")
        coder.encode(expiredAt, forKey: "expiredAt")
    }
    
    required init?(coder: NSCoder) {
        brand = coder.decodeObject(forKey: "brand") as! String
        capacity = coder.decodeInteger(forKey: "capacity")
        price = coder.decodeInteger(forKey: "price")
        name = coder.decodeObject(forKey: "name") as! String
        manufacturedAt = coder.decodeObject(forKey: "manufacturedAt") as! Date
        expiredAt = coder.decodeObject(forKey: "expiredAt") as! Date
    }
    
    public func isExpired(over standard: Date) -> Bool {
        return standard <= manufacturedAt
    }
    
    public func canSell(to buyer: PaymentManager) -> Bool {
        price <= buyer.money
    }
}

protocol Hotable {
    func isHot(over standard: Int) -> Bool
}

protocol SafeDateChecker {
    func isExpired(over standard: Date) -> Bool
}

protocol LowCalorieChecker {
    func isLowCalorie(over standard: Int) -> Bool
}

