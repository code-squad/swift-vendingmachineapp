//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class Beverage : CustomStringConvertible {
    private var brand : String
    private var capacity :  Int
    private(set) var price : Int
    private var name : String
    private let createdAt : Date
    private let expiredAt : Date
    
    var description: String {
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
    
    required init() {
        self.brand = ""
        self.capacity = 0
        self.price = 0
        self.name = ""
        self.createdAt = Date()
        self.expiredAt = Date().get7daysLatter()
    }
}

extension Beverage : Drinkable {
    // 유통기한이 지난 경우 true를 반환
    func isExpired() -> Bool {
        return expiredAt.isExpired()
    }
}
extension Beverage : Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand &&
            lhs.capacity == rhs.capacity &&
            lhs.price == rhs.price &&
            lhs.name == rhs.name
    }
}

extension Beverage : Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(capacity)
        hasher.combine(price)
        hasher.combine(name)
    }
}
