//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Beverage {

    enum Kind {
        case milk
        case soda
        case coke
    }
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufacture.toString())"
    }
    
    private var brand: String
    private var capacity: Int
    private var price: Int
    private(set) var name: String
    private var manufacture: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacture = manufacture
    }
    
}
