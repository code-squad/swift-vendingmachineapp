//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//
import Foundation

class Beverage {
    private let brand: String
    private let volume: Int
    private (set) var price: Int
    private let name: String
    private let manufacturedAt: Date
    private let temparature: Int
    private let calories: Int
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temparature: Int, calories: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedAt = manufacturedAt
        self.temparature = temparature
        self.calories = calories
    }
}

extension Beverage: BeverageDetail {
    func isExpired(now date: Date) -> Bool {
        return manufacturedAt < date ? true : false
    }
    
    func isHot(temparature standard: Int) -> Bool {
        return self.temparature > standard ? true : false
    }
    
    func isLowCalorie(calories standard: Int) -> Bool {
        return self.calories < standard ? true : false
    }
    
    func isPurchasable(balance: Int) -> Bool {
        return self.price <= balance
    }
}

extension Beverage: Hashable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
