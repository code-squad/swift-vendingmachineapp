//
//  Beverage.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class Beverage{
    private var manufacturer: String
    private var volume: Int
    private(set) var price: Int
    private var brand: String
    private var manufactured: Date
    private var expiry: Date
    private var calorie: Int
    private var temperature: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.price = price
        self.brand = brand
        self.manufactured = manufactured
        self.expiry = expiry
        self.calorie = calorie
        self.temperature = temperature
    }
    
    func isLowCalorie(with compare: Int) -> Bool {
        return self.calorie <= compare
    }
    
    func isHot(with compare: Int) -> Bool {
        return self.temperature >= compare
    }
    
    func validateExpiryTime(with date: Date) -> Bool {
        return expiry >= date
    }
    
    func isAvailablePurchase(with money: Money) -> Bool {
        return money.compare(with: price)
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
