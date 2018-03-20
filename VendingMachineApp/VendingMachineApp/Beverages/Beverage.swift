//
//  Beverage.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    var type: String {
        return "음료"
    }
    private var brand: String
    private var weight: Int
    private var itemPrice: Int
    private var name: String
    private var manufactured: Date
    private let validDuration: Int
    private var calorie: Int
    private var hot: Bool
    private var caffeine: Int

    var description: String {
        return "\(type) - \(brand) | \(weight)ml | \(itemPrice)원 | \(name) | \(manufactured.description)"
    }

    init() {
        self.brand = ""
        self.weight = 0
        self.itemPrice = 0
        self.name = ""
        self.manufactured = Date()
        self.validDuration = 0
        self.calorie = 0
        self.hot = false
        self.caffeine = 0
    }

    init(brand: String, weight: Int, price: Int, name: String, manufactured: String, valid: Int, calorie: Int, hot: Bool, caffeine: Int) {
        self.brand = brand
        self.weight = weight
        self.itemPrice = price
        self.name = name
        self.manufactured = Date(yyyyMMdd: manufactured)
        self.validDuration = valid
        self.calorie = calorie
        self.hot = hot
        self.caffeine = caffeine
    }

    func isHot() -> Bool {
        return self.hot
    }

    func isDecaf() -> Bool {
        return self.caffeine < 200
    }

    func package() -> Package {
        return .pet
    }

    func price() -> Int {
        return self.itemPrice
    }

    func isValid() -> Bool {
        return self.manufactured.isOutOfDate(validDuration: self.validDuration)
    }

    func isCheaper(than money: Int) -> Bool {
        return self.itemPrice < money
    }

    func isLowCalorie() -> Bool {
        return self.calorie < 300
    }

}
