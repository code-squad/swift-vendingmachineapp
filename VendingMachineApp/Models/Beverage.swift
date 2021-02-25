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
    private var price : Int
    private var name : String
    private var create : Date
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(create.toString())"
    }
    init(brand : String, capacity : Int, price : Int, name : String, create : String){
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.create = create.toDate()
    }
}
