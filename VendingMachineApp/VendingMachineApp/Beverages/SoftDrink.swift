//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class SoftDrink: Beverage {
    private let validDuration = 365
    private let calorie = 500
    private let hot = false
    private let caffeine = 50
    override var type: String {
        return "콜라"
    }

    init(brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, valid: self.validDuration, calorie: self.calorie, hot: self.hot, caffeine: self.caffeine)
    }

    override init() {
        super.init(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20180322", valid: self.validDuration, calorie: self.calorie, hot: self.hot, caffeine: self.caffeine)
    }

    override func package() -> Package {
        return .pet
    }

}
