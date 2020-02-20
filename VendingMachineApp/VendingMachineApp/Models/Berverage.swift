//
//  Berverage.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Beverage {
    let name: String
    let brand: String
    let servingSize: Int
    let price: Int
    let dateOfManufacture: Date
    
    init(name: String, brand: String, servingSize: Int, price: Int, dateOfManufacture: Date) {
        self.name = name
        self.brand = brand
        self.servingSize = servingSize
        self.price = price
        self.dateOfManufacture = dateOfManufacture
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return "\(brand), \(name), \(servingSize)ml, \(price)원, \(dateFormatter.string(from: dateOfManufacture))"
    }
}
