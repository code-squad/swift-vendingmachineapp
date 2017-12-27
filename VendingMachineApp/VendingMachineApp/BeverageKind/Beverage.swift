//
//  File.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

protocol BeverageCheck {
    func validate(with: Date) -> Bool
    func isHot() -> Bool
}

class Beverage: CustomStringConvertible, Hashable {
    private var brand: String
    private var volume: Int
    private (set) var price: Int
    private (set) var temperature: Double
    private (set) var name: String
    private (set) var manufacturingDate: Date
    var hashValue: Int {
        return name.hashValue
    }
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name
    }
    var description: String {
        let date = DateFormatter()
        date.dateFormat = "yyyyMMdd"
        return "\(brand), \(volume)ml, \(price)원, \(name), \(date.string(from: manufacturingDate))"
    }
    init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: String, temperature: Double) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.temperature = temperature
        let date = DateFormatter()
        date.dateFormat = "yyyyMMdd"
        self.manufacturingDate = Date(timeInterval: DateInterval.today.rawValue, since: date.date(from: manufacturingDate)!)
    }
    func checkAvailableList(with balance: Int) -> Bool {
        return balance >= price
    }
}
