//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import Foundation

class Beverage: NSObject, NSCoding {

    private var manufacturer: String
    private var volume: Int
    private var price: Int
    private var subbrand: String
    private var manufacturedAt: Date
    private var expiration: Date
    private var skuName: String
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.price = price
        self.subbrand = subbrand
        self.manufacturedAt = manufacturedAt
        self.expiration = expiration
        self.skuName = skuName
    }
    
    required override init() {
        self.manufacturer = ""
        self.volume = 0
        self.price = 0
        self.subbrand = ""
        self.manufacturedAt = Date()
        self.expiration = Date()
        self.skuName = ""
    }
    
    required init?(coder: NSCoder) {
        self.manufacturer = coder.decodeObject(forKey: "manufacturer") as! String
        self.volume = coder.decodeInteger(forKey: "volume")
        self.price = coder.decodeInteger(forKey: "price")
        self.subbrand = coder.decodeObject(forKey: "subbrand") as! String
        self.manufacturedAt = coder.decodeObject(forKey: "manufacturedAt") as! Date
        self.expiration = coder.decodeObject(forKey: "expiration") as! Date
        self.skuName = coder.decodeObject(forKey: "skuName") as! String
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(manufacturer, forKey: "manufacturer")
        coder.encode(volume, forKey: "volume")
        coder.encode(price, forKey: "price")
        coder.encode(subbrand, forKey: "subbrand")
        coder.encode(manufacturedAt, forKey: "manufacturedAt")
        coder.encode(expiration, forKey: "expiration")
        coder.encode(skuName, forKey: "skuName")
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? Beverage {
            return self.manufacturer == object.manufacturer && self.volume == object.volume && self.price == object.price && self.subbrand == object.subbrand && self.skuName == object.skuName
        }
        return false
    }
    
    override var description: String {
        return "\(manufacturer), \(volume), \(price), \(subbrand), \(manufacturedAt), \(expiration), \(skuName)"
    }
    
    public func showPrice() -> Int {
        return self.price
    }
    
    public func isNotExpired() -> Bool {
        return expiration > Date()
    }

}
