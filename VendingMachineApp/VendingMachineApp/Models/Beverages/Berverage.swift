//
//  Berverage.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

protocol Producible {
    static var produce: ((_ at: Date) -> (Beverage)) { get set }
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
        self.name = coder.decodeObject(forKey: .name) as? String ?? ""
        self.brand = coder.decodeObject(forKey: .brand) as? String ?? ""
        self.servingSize = coder.decodeInteger(forKey: .servingSize)
        self.price = coder.decodeObject(forKey: .price) as? Money ?? Money()
        self.manufactureDate = coder.decodeObject(forKey: .manufactureDate) as? Date ?? Date()
        self.expirationDate = coder.decodeObject(forKey: .expirationDate) as? Date ?? Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(object: name, forKey: .name)
        coder.encode(object: brand, forKey: .brand)
        coder.encode(value: servingSize, forKey: .servingSize)
        coder.encode(object: price, forKey: .price)
        coder.encode(object: manufactureDate, forKey: .manufactureDate)
        coder.encode(object: expirationDate, forKey: .expirationDate)
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
