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
    private var createdAt : Date
    private let expiredAt : Date
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(createdAt.toString()), \(expiredAt.toString())"
    }
    init(brand : String, capacity : Int, price : Int, name : String, createdAt : String, expiredAt : String){
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.createdAt = createdAt.toDate()
        self.expiredAt = expiredAt.toDate()
    }
}

extension Beverage : Drinkable {
    // 유통기한이 지난 경우 true를 반환
    func isExpired() -> Bool {
        let calendar = Calendar.current
        return calendar.compare(expiredAt, to: Date(), toGranularity: .day) == .orderedAscending
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
extension Beverage {
    func compare(with name :String) -> Bool{
        return self.name == name
    }
}
