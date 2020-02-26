//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Beverage {
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var manufacturingDate: Date
    private var expirationDate: Date
    private var calorie: Double
    private var hot: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturingDate: Date, expirationDate: Date, calorie: Double, hot: Bool) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
        self.expirationDate = expirationDate
        self.calorie = calorie
        self.hot = hot
    }
    
    func canBuy(have balance: Int) -> Bool {
        return balance >= price
    }
    
    func isSafe() -> Bool {
        return CustomDateFormatter.convertDate(date: expirationDate) > CustomDateFormatter.convertDate(date : Date())
    }
    
    func getPrice() -> Int {
        return price
    }
    
    func isHot() -> Bool {
        return hot
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(capacity), \(price), \(name)"
    }
}

extension Beverage: Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return (lhs.brand == rhs.brand) && (lhs.name == rhs.name) && (lhs.capacity == rhs.capacity)
    }
}
