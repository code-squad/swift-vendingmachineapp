//
//  Drink.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/22.
//

import Foundation

class Drink : CustomStringConvertible{
    
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var manufacturedDate: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date){
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedDate = date
    }
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufacturedDate)"
    }

}
