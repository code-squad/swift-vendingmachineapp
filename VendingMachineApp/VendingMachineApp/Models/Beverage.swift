//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Beverage {
    
    public var price: Int
    private var brand: String
    private var weight: Int
    private var name: String
    private var expirationDate: Date
    private var temperature: Double
    private var calorie: Double
    
    public init(
        brand: String,
        weight: Int,
        price: Int,
        name: String,
        dateOfManufacture: Date,
        temperature: Double,
        calorie: Double
    ) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.expirationDate = dateOfManufacture
        self.temperature = temperature
        self.calorie = calorie
    }
    
    public func validDate(_ date: Date) -> Bool {
        date < expirationDate
    }
    
    public func isHot(_ standard: Double) -> Bool {
        temperature > standard
    }
    
    public func isHighCalorie(_ standard: Double) -> Bool {
        calorie > standard
    }
}

extension Beverage: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        lhs.name == rhs.name
    }
}
