//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Beverage: CustomStringConvertible {
    
    private let brand: String
    private let volume: Int
    private let price: Int
    private let name: String
    private let manufactured: Date?
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(Date.getString(from: manufactured) ?? "")"
    }
    
    init(brand: String, volume: Int, price: Int, name: String, manufactured: String) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufactured = Date.getDate(from: manufactured)
    }
}
