//
//  Beverage.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

let compareCalorie = 300
let compareHot = 50

class Beverage{
    private var manufacturer: String
    private var volume: Int
    private(set) var price: Int
    private var brand: String
    private var manufactured: Date
    private var expiryTime: Date
    private var calorie: Int
    private var hot: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expirydate: Date, calorie: Int, hot: Int) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.price = price
        self.brand = brand
        self.manufactured = manufactured
        self.expiryTime = expirydate
        self.calorie = calorie
        self.hot = hot
    }
    
    func isLowCalorie() -> Bool {
        return calorie <= compareCalorie
    }
    
    func isHot() -> Bool {
        return hot >= compareHot
    }
    
    func validateExpiryTime(with date: Date) -> Bool {
        return expiryTime >= date
    }
    
    func isAvailablePurchase(with money: Int) -> Bool {
        return money >= price
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(manufacturer), \(volume)ml, \(price)원, \(brand), \(manufactured.description)"
    }
}

extension Beverage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.brand)
    }
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand
    }
}
