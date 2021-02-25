//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Beverage : CustomStringConvertible {
    private let brand : String
    private let liter : Int
    private(set) var price : Int
    private let name : String
    private let manufactured : Date
    private let expiryDate : Date
    private let hot : Bool
    private let calory : Int
        
    init(brand : String, liter : Int, price : Int, name : String, manufactured : Date, expiryDate : Date, hot : Bool, calory : Int) {
        self.brand = brand
        self.liter = liter
        self.price = price
        self.name = name
        self.manufactured = manufactured
        self.expiryDate = expiryDate
        self.hot = hot
        self.calory = calory
    }
    
    var description: String {
        return "\(brand), \(liter)ml, \(price)원, \(name), \(manufactured.description)"
    }
    
    func isPossible(money : Int) -> Bool {
        return self.price <= money
    }
    
    func validate(with date:Date) -> Bool {
        return expiryDate < date
    }
    
    func isHot() -> Bool {
        return hot == true
    }
    
    func isLowCalorie() -> Bool {
        return calory > 10
    }
}

extension Beverage : Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price
    }
}

extension Beverage : Hashable {
    func hash(into hasher: inout Hasher) {
           hasher.combine(name)
           hasher.combine(price)
        }
}
