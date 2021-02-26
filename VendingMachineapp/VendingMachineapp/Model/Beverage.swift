//
//  Beverage.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

let compareCalorie = 300

class Beverage{
    private var manufacturer: String
    private var volume: Int
    private var price: Int
    private var brand: String
    private var manufactured: Date
    private var expirydate: Date
    private var calorie: Int
    private var hot: Bool
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expirydate: Date, calorie: Int, hot: Bool) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.price = price
        self.brand = brand
        self.manufactured = manufactured
        self.expirydate = expirydate
        self.calorie = calorie
        self.hot = hot
    }
    
    func isLowCalorie() -> Bool {
        return calorie < compareCalorie
    }
    
    func isHot() -> Bool {
        return hot
    }
    
    func validate(with date: Date) -> Bool {
        return expirydate > date
    }
    
    func isAvailablePurchase(with money: Int) -> Bool {
        return money > price
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
    
    var hashValue: Int {
        var hasher = Hasher()
        self.hash(into: &hasher)
        return hasher.finalize()
    }
}
