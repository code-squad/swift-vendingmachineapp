//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/25.
//

import Foundation

class Beverage: CustomStringConvertible, Beveragable  {
    
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufacturedAt.description)"
    }
    
    private var brand: String
    private var volume: Int
    private var price: Int
    private var name: String
    private var manufacturedAt: Date
    private var temperature: Double
    private var expirationDate: Date
    private var calory: Int
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temperature: Double, expirationDate: Date, calory: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedAt = manufacturedAt
        self.temperature = temperature
        self.expirationDate = expirationDate
        self.calory = calory
    }
    
    func isExpired(with date: Date) -> Bool {
        return expirationDate < date
    }
    
    func isHot() -> Bool {
        return temperature >= 65.0
    }
    
    func isLowCalorie() -> Bool {
        return calory < 50
    }
}
