//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Beverage : CustomStringConvertible {
    private let brand : String
    private let amount : Int
    private let unit : Unit
    private let price : Int
    private let name : String
    private let manufactured : Date
    private let expiration : Date
    private let temperature : Int
    private let calorie : Int
    
    enum Unit {
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
    
    var description: String {
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

extension Beverage : Hashable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price &&
            lhs.brand == rhs.brand && lhs.amount == rhs.amount &&
            lhs.unit == rhs.unit && lhs.calorie == rhs.calorie
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(price)
    }
}
