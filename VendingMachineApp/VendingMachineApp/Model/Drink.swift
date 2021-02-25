//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/22.
//

import Foundation


class Drink : CustomStringConvertible {
    
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name : String
    private let madeDate : Date
    
    init(brand: String, capacity: Int, price: Int, name: String, madeDate: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.madeDate = madeDate
    }
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(madeDate.getStringFromDate())"
    }
}




