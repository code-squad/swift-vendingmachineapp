//
//  Beverage.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {

    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"

        return "\(self.brand), \(self.volume)ml, \(self.price)원, \(self.name), \(dateFormatter.string(from: self.date))"
    }

    private var brand: String
    private var name: String
    private var volume: Int
    private (set) var price: Int
    private var date: Date

    init(brand: String, name: String, volume: Int, price: Int, manufacturedDate: Date) {
        self.brand = brand
        self.name = name
        self.volume = volume
        self.price = price
        self.date = manufacturedDate
    }

}
