//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Beverage: CustomStringConvertible {
    
    private let brand: String
    private let name: String
    private let price: Int
    private let size: Int
    private let manufactured: Date
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date) {
        self.brand = brand
        self.name = name
        self.price = price
        self.size = size
        self.manufactured = manufactured
    }

    var description: String {
        return "[\(brand)] \(name): ₩\(price), \(size)ml (\(manufactured.description))"
    }
}
