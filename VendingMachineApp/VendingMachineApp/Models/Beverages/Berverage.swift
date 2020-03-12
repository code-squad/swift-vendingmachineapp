//
//  Berverage.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

protocol Producible {
    static func produce(at manufactureDate: Date) -> Beverage
}

class Beverage: NSObject, NSCoding {
    let name: String
    let brand: String
    let servingSize: Int
    let price: Money
    let manufactureDate: Date
    let expirationDate: Date
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date) {
        self.name = name
        self.brand = brand
        self.servingSize = servingSize
        self.price = price
        self.manufactureDate = manufactureDate
        self.expirationDate = expirationDate
    }
    
    private enum Keys: String {
        case name = "name"
        case brand = "brand"
        case servingSize = "servingSize"
        case price = "price"
        case manufactureDate = "manufactureDate"
        case expirationDate = "expirationDate"
        
        func keyString() -> String {
            return self.rawValue
        }
    }
    
    required init?(coder: NSCoder) {
        guard
            let name = coder.decodeObject(forKey: Keys.name.keyString()) as? String,
            let brand = coder.decodeObject(forKey: Keys.brand.keyString()) as? String,
            let servingSize = coder.decodeObject(forKey: Keys.servingSize.keyString()) as? Int,
            let price = coder.decodeObject(forKey: Keys.price.keyString()) as? Money,
            let manufactureDate = coder.decodeObject(forKey: Keys.manufactureDate.keyString()) as? Date,
            let expirationDate = coder.decodeObject(forKey: Keys.expirationDate.keyString()) as? Date
        else { return nil }
        self.name = name
        self.brand = brand
        self.servingSize = servingSize
        self.price = price
        self.manufactureDate = manufactureDate
        self.expirationDate = expirationDate
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: Keys.name.keyString())
        coder.encode(brand, forKey: Keys.brand.keyString())
        coder.encode(servingSize, forKey: Keys.servingSize.keyString())
        coder.encode(price, forKey: Keys.price.keyString())
        coder.encode(manufactureDate, forKey: Keys.price.keyString())
        coder.encode(expirationDate, forKey: Keys.price.keyString())
    }
    
    func isPurchasable(with balance: Money) -> Bool {
        return price >= balance
    }
    
    func validate(with date: Date) -> Bool {
        return Date() < expirationDate
    }
    
    func objectIdentifier() -> ObjectIdentifier {
        return ObjectIdentifier(type(of: self))
    }
}

extension Beverage {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    override var description: String {
        return "\(brand), \(name), \(servingSize)ml, \(price)원, 제조일자: \(manufactureDate.dateFormatString())"
    }
}
