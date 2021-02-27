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
    private var create : Date
    private let expire : Date
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(create.toString()), \(expire.toString())"
    }
    init(brand : String, capacity : Int, price : Int, name : String, create : String, expire : String){
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.create = create.toDate()
        self.expire = expire.toDate()
    }
    func available(with coins: Int) -> Bool {
        return price <= coins
    }
    
    func didExpiredate() -> Bool {
        let calendar = Calendar.current
        return calendar.compare(Date(), to: expire, toGranularity: .day) == .orderedAscending
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
