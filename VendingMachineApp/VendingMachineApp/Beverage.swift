//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/25.
//

import Foundation

class Beverage: CustomStringConvertible  {
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufacturedDate)"
    }
    
    private var brand: String
    private var volume: Int
    private var price: Int
    private var name: String
    private var manufacturedDate: Date
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
    }
}
