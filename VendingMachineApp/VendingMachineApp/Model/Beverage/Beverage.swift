//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Beverage {
    enum Calorie: Double {
        case Low = 5
        case Middle = 100
        case High = 200
        
        func isZero() -> Bool{
            return self == Beverage.Calorie.Low
        }
    }
    
    enum Temperature: Double {
        case Cool = 10
        case Tepid = 35
        case Hot = 65
        
        func isHotter(than standard: Double) -> Bool {
            return self.rawValue >= standard
        }
    }
    
    private var brand: String
    private var capacity: Double
    private(set) var price: Price
    private var name: String
    private var manufacturingDate: Date
    private var expirationDate: Date
    private var calorie: Calorie
    private var temperature: Temperature
    private(set) var beverageIndex: VendingMachine.BeverageNumbers
    
    init(brand: String, capacity: Double, price: Price, name: String, manufacturingDate: Date, calorie: Calorie, temperature: Temperature, beverageIndex: VendingMachine.BeverageNumbers) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
        self.expirationDate = Date(timeInterval: 86400 * 14, since: manufacturingDate)
        self.calorie = calorie
        self.temperature = temperature
        self.beverageIndex = beverageIndex
    }
    
    func canBuy(have balance: Int) -> Bool {
        return price.isCheaper(than: Price(balance))
    }
    
    func isSafe() -> Bool {
        return expirationDate > Date()
    }
    
    func isHot(standard: Double) -> Bool {
        return temperature.isHotter(than: standard)
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(name)"
    }
}

extension Beverage: Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return (lhs.brand == rhs.brand) && (lhs.name == rhs.name) && (lhs.capacity == rhs.capacity)
    }
}
