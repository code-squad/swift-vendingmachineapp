//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Beverage {
    
    private let brand: String
    private let volume: Int
    private let price: Int
    private let name: String
    private let manufactureDate: Date
    
    init(brand: String, volume: Int, price: Int, name: String, manufactureDate: String) throws {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufactureDate = try DateUtility.getDate(from: manufactureDate)
    }
}
