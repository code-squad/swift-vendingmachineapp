//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Beverage: NSObject, NSCoding {
    private let brand: String
    private let size: Int
    private let price: Int
    public let name: String
    private let packageTime: Date
    
    init(brand: String, size: Int, price: Int, name: String, packageTime: Date) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.packageTime = packageTime
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(size, forKey: "size")
        coder.encode(price, forKey: "price")
        coder.encode(name, forKey: "name")
        coder.encode(packageTime, forKey: "packageTime")
    }
    
    required init?(coder: NSCoder) {
        brand = coder.decodeObject(forKey: "brand") as! String
        size = coder.decodeInteger(forKey: "size")
        price = coder.decodeInteger(forKey: "price")
        name = coder.decodeObject(forKey: "name") as! String
        packageTime = coder.decodeObject(forKey: "packageTime") as! Date
    }
    
    public func isPurchasable(with money: Int) -> Bool {
        return self.price <= money
    }
    
    public func showPrice() -> Int {
        return self.price
    }
    
    public func isExpired(on date: Date) -> Bool {
        return self.packageTime.isOld(on: date)
    }
}

extension Beverage {
    override var description: String {
        let simpleDateFormat = "yyyyMMdd"
        return "\(brand), \(size)ml, \(price)원, \(name), \(packageTime.useSimpleFormat(dateFormat: simpleDateFormat))"
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand &&
            lhs.size == rhs.size &&
            lhs.price == rhs.price &&
            lhs.name == rhs.name &&
            lhs.packageTime == rhs.packageTime
    }
}




