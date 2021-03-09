//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/25.
//

import Foundation

class Beverage: CustomStringConvertible {
    
    private let brand: String
    private let capacity: Int
    private(set) var price: Int
    private let name: String
    private let manufactureAt: Date
    private let expireAt: Date
    private let caffeineContent: Int
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufactureAt.productDisplayFormat)"
    }
    
    init(brand: String, capacity: Int, price: Int, name: String, expireDate: String, caffeineContent: Int){
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufactureAt = Date(timeIntervalSinceNow: -86400) // 제조일자 = 어제
        self.expireAt = Date.converToDate(from: expireDate)
        self.caffeineContent = caffeineContent
    }
    
    func isValid(with date: Date) -> Bool {
        return date <= expireAt
    }
    
    func isHighCaffeine() -> Bool {
        return (Double(caffeineContent) / Double(capacity)) > 0.15
    }
}

extension Beverage: Hashable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return ObjectIdentifier(type(of: lhs)) == ObjectIdentifier(type(of: rhs))
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}


 
