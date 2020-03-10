//
//  ElementsOfBeverage.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class ElementsOfBeverage {
    var brand: String
    var weight: Int
    var price: Int
    var name: String
    var date: Date
    
    init(brand: String, weight: Int, price: Int, name: String) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        date = Date()
    }
}

extension ElementsOfBeverage: CustomStringConvertible {
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return brand + ", " + String(weight) + "ml, " + String(price) + "원, " + name + ", " + dateFormatter.string(from: date)
    }
}
