//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/22.
//

import Foundation

class Beverage: NSObject, NSCoding {
    private var brand: String
    private var capacity: Int
    private (set) var price: Money
    private var name: String
    private var manufacturedDate: Date
    private var expiration: Date
    private var hot: Bool
    private var calorie: Int
    

    
    init(brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expiration: Date, hot: Bool, calorie: Int){
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
        self.expiration = expiration
        self.hot = hot
        self.calorie = calorie
    }
    
    required override init() {
        self.brand = ""
        self.capacity = 0
        self.price = Money()
        self.name = ""
        self.manufacturedDate = Date()
        self.expiration = Date()
        self.hot = false
        self.calorie = 0
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(capacity, forKey: "capacity")
        coder.encode(price, forKey: "price")
        coder.encode(name, forKey: "name")
        coder.encode(manufacturedDate, forKey: "manufacturedDate")
        coder.encode(expiration, forKey: "expiration")
        coder.encode(hot, forKey: "hot")
        coder.encode(calorie, forKey: "calorie")
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: "brand") as! String
        self.capacity = coder.decodeObject(forKey: "capacity") as! Int
        self.price = coder.decodeObject(forKey: "price") as! Money
        self.name = coder.decodeObject(forKey: "name") as! String
        self.manufacturedDate = coder.decodeObject(forKey: "manufacturedDate") as! Date
        self.expiration = coder.decodeObject(forKey: "expiration") as! Date
        self.hot = coder.decodeObject(forKey: "hot") as! Bool
        self.calorie = coder.decodeObject(forKey: "calorie") as! Int
    }
    
    override var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufacturedDate.description)"
    }
    
    func canBuy(with credit: Money) -> Bool {
        return credit > price
    }
    
    func isHot() -> Bool {
        return hot
    }
    
    func isLowCalore() -> Bool {
        return calorie < 300
    }
    
    func validate(date: Date) -> Bool {
        return expiration < date
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name
    }
}
