//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Beverage : CustomStringConvertible {
    private let brand : String
    private let liter : Int
    private let price : Int
    private let name : String
    private let manufactured : Date
    
    init(brand : String, liter : Int, price : Int, name : String, manufactured : Date) {
        self.brand = brand
        self.liter = liter
        self.price = price
        self.name = name
        self.manufactured = manufactured
    }
    
    var description: String {
        return "\(brand), \(liter)ml, \(price)원, \(name), \(manufactured.description)"
    }
}
