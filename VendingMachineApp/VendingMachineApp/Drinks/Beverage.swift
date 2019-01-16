//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Beverage {
    var name: String
    var brand: String
    var volume: Int
    var price: Int
    var menufactureOfDate: Date
    
    init(name: String, volume: Int, price: Int, brand: String, date: String) {
        self.name = name
        self.brand = brand
        self.volume = volume
        self.price = price
        self.menufactureOfDate = DateFormat.convertDate(date)
    }
    
    func convertToStringBeverage() -> String {
        return ""
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        let datePrint = DateFormat.set().string(from: self.menufactureOfDate)
        return "\(type(of: self)) - \(name), \(volume)ml, \(price)원, \(brand), \(datePrint)"
    }
}
