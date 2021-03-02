//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Beverage {

    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufacture.toString())"
    }
    
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var manufacture: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacture = manufacture
    }
    
}

protocol Hotable {
    func checkHot() -> Bool
}

protocol SafeDateChecker {
    func expirationValidate(with date:Date) -> Bool
}

protocol LowCalorieChecker {
    func isLowCalorie() -> Bool
}
