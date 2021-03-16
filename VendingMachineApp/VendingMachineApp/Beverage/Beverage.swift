//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//
import Foundation

class Beverage: NSObject, NSCoding {
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
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "beverageBrand")
        coder.encode(volume, forKey: "beverageVolume")
        coder.encode(price, forKey: "beveragePrice")
        coder.encode(name, forKey: "beverageName")
        coder.encode(manufacturedAt, forKey: "beverageManufacturedAt")
        coder.encode(temparature, forKey: "beverageTemparature")
        coder.encode(calories, forKey: "beverageCalories")
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: "beverageBrand") as? String ?? ""
        self.volume = coder.decodeInteger(forKey: "beverageVolume")
        self.price = coder.decodeInteger(forKey: "beveragePrice")
        self.name = coder.decodeObject(forKey: "beverageName") as? String ?? ""
        self.manufacturedAt = coder.decodeObject(forKey: "beverageManufacturedAt") as? Date ?? Date().addingTimeInterval(86400)
        self.temparature = coder.decodeInteger(forKey: "beverageTemparature")
        self.calories = coder.decodeInteger(forKey: "beverageCalories")
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name && lhs.brand == rhs.brand &&
            lhs.price == rhs.price && lhs.name == rhs.name
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
