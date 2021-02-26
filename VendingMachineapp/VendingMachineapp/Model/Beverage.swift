//
//  Beverage.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class Beverage{
    private var manufacturer: String
    private var volume: Int
    private var price: Int
    private var brand: String
    private var manufactured: Date
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.price = price
        self.brand = brand
        self.manufactured = manufactured
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(manufacturer), \(volume)ml, \(price)원, \(brand), \(manufactured.description)"
    }
}
