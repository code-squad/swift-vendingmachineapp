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
    private var dateOfManufacture: Date
    private var additionalElements: String = ""
    private var dateFormat: String = "yyyyMMdd"
    var descriptionBrand: String {
        brand + ", "
    }
    var descriptionWeight: String {
        String(weight) + "ml, "
    }
    var descriptionPrice: String {
        String(price) + "원, "
    }
    var descriptionName: String {
        name + ", "
    }
    
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

extension Beverage: CustomStringConvertible {
    var description: String {
        return descriptionBrand + descriptionWeight + descriptionPrice + descriptionName + dateOfManufacture.customDateFormatToString(format: dateFormat) + additionalElements
    }
}

