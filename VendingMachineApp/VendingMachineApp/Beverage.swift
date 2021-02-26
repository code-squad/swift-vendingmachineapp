//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class Beverage: CustomStringConvertible {
    private let brand: String
    private let volume: Int
    private let price: Int
    private let name: String
    private let manufacturedAt: Date
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufacturedAt.formattedDate())"
    }
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedAt = manufacturedAt
    }
}
