//
//  ElementsOfBeverage.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class ElementsOfBeverage {
    
    private var brand: String
    private var weight: Int
    private var price: Int
    private var name: String
    private var dateOfManufacture: Date
    private var dateGenerator: DateGenerator = DateGenerator()
    private var additionalElements: String = ""
    
    init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
    }
    
    func apply(featureOfBeverage: [String]) {
        featureOfBeverage.forEach { additionalElements.append(", " + $0) }
    }
}

extension ElementsOfBeverage: CustomStringConvertible {
    var description: String {
        return brand + ", " + String(weight) + "ml, " + String(price) + "원, " + name + ", " + dateGenerator.transrate(date: dateOfManufacture) + additionalElements
    }
}

