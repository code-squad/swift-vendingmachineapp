//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class Beverage : NSObject, NSCoding {
    
    private let brand : String
    private let capacity :  Int
    private(set) var price : Int
    private let name : String
    private let createdAt : Date
    private let expiredAt : Date
    
    override var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(createdAt.toString()), \(expiredAt.toString())"
    }
    init(brand : String, capacity : Int, price : Int, name : String, createdAt : Date, expiredAt : Date){
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.createdAt = createdAt
        self.expiredAt = expiredAt
    }
    required override init() {
        self.brand = ""
        self.capacity = 0
        self.price = 0
        self.name = ""
        self.createdAt = Date()
        self.expiredAt = Date().get7daysLatter()
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: "brand") as! String
        self.capacity = coder.decodeInteger(forKey: "capacity")
        self.price = coder.decodeInteger(forKey: "price")
        self.name = coder.decodeObject(forKey: "name") as! String
        self.createdAt = coder.decodeObject(forKey: "createdAt") as! Date
        self.expiredAt = coder.decodeObject(forKey: "expiredAt") as! Date
    }
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(capacity,forKey: "capacity")
        coder.encode(price, forKey: "price")
        coder.encode(name, forKey: "name")
        coder.encode(createdAt, forKey: "createdAt")
        coder.encode(expiredAt, forKey: "expiredAt")
    }
}
extension Beverage {
    public static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand
            && lhs.capacity == rhs.capacity
            && lhs.price == rhs.price
            && lhs.name == rhs.name
    }
}
extension Beverage : Drinkable {
    // 유통기한이 지난 경우 true를 반환
    func isExpired(to date : Date) -> Bool {
        return expiredAt.isExpired(to: date)
    }
}

