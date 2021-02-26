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
    private let expiration : Date
    private let temperature : Int
    private let calorie : Int
        
    init(brand : String, liter : Int, price : Int, name : String, manufactured : Date, expiration : Date, temperature : Int, calorie : Int) {
        self.brand = brand
        self.liter = liter
        self.price = price
        self.name = name
        self.manufactured = manufactured
        self.expiration = expiration
        self.temperature = temperature
        self.calorie = calorie
    }
    
    var description: String {
        return "\(brand), \(liter)ml, \(price)원, \(name), \(manufactured.description)"
    }
    
    func isPossiblePurchase(money : Int) -> Bool {
        return price <= money
    }
    
    func validate(with date:Date) -> Bool {
        return expiration < date
    }
    
    func isHot(standard : Int) -> Bool {
        return temperature >= standard
    }
    
    func isLowCalorie(standard : Int) -> Bool {
        return calorie > standard
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
