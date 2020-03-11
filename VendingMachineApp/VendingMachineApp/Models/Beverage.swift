//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Beverage {
    
    private var brand: String
    private var weight: Int
    private var price: Int
    private var name: String
    private var expirationDate: Date
    private var additionalElements: String = ""
    private var temperature: Double
    private var calorie: Double
    public var isHot: Bool {
        temperature > 0 ? true : false
    }
    public var isLowerCalorie: Bool {
        calorie > 200 ? true : false
    }
    public var descriptionBrand: String {
        brand + ", "
    }
    public var descriptionWeight: String {
        String(weight) + "ml, "
    }
    public var descriptionPrice: String {
        String(price) + "원, "
    }
    public var descriptionName: String {
        name + ", "
    }
    
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
    
    public func apply(featureOfBeverage: [String]) {
        featureOfBeverage.forEach { additionalElements.append(", " + $0) }
    }
    
    public func validDate(_ date: Date) -> Bool {
        date < expirationDate
    }
    
    public func valid(to cost: Int) -> Bool {
        cost > price ? true : false
    }
    
    public func balance(payment: Int) -> Int {
        payment - price
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
