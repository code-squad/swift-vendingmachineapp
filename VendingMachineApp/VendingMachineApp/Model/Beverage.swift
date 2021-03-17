//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Beverage: NSObject, NSCoding {// Hashable
    
    private let brand: String
    private let volume: Int
    let price: Int
    private let name: String
    private let createdAt: Date
    private let expiredAt: Date
    
    override var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(DateConverter.format(from: createdAt))"
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return type(of: lhs) == type(of: rhs)
    }

//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(ObjectIdentifier(type(of: self)))
//    }
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.createdAt = createdAt
        self.expiredAt = expiredAt
    }
    
    required override init() {
        self.brand = "brand"
        self.volume = 0
        self.price = 0
        self.name = "name"
        self.createdAt = Date()
        self.expiredAt = Date()
    }
    
    required init?(coder decoder: NSCoder) {
        brand = decoder.decodeObject(forKey: "brand") as! String
        volume = decoder.decodeInteger(forKey: "volume")
        price = decoder.decodeInteger(forKey: "price")
        name = decoder.decodeObject(forKey: "name") as! String
        createdAt = decoder.decodeObject(forKey: "createdAt") as! Date
        expiredAt = decoder.decodeObject(forKey: "expiredAt") as! Date
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(volume, forKey: "volume")
        coder.encode(price, forKey: "price")
        coder.encode(name, forKey: "name")
        coder.encode(createdAt, forKey: "createdAt")
        coder.encode(expiredAt, forKey: "expiredAt")
    }
    
    
    //MARK:- method
    
    func isExpired(current: Date) -> Bool {
        return expiredAt < current
    }
}


