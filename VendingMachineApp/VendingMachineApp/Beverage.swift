//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

class Beverage : CustomStringConvertible {
        
    private let brand : String
    private let volume : Int
    private let price : Int
    private let name : String
    private let manufactured : Date
    
    init(brand : String, volume : Int, price : Int, name: String, manufactured : Date){
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufactured = manufactured
    }
    
    var description: String {
        return "\(self.brand), \(self.volume)ml, \(self.price)원, \(self.name), \(Date().yyyyMMddFormat(date: manufactured))"
    }
}
