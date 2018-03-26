//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class BananaMilk: Beverage {
    private let validDuration = 3
    private let calorie = 230
    private let hot = false
    private let caffeine = 0
    override var type: String {
        return "바나나우유"
    }

    init(brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, valid: self.validDuration, calorie: self.calorie, hot: self.hot, caffeine: self.caffeine)
    }

    override init() {
        super.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180322", valid: self.validDuration, calorie: self.calorie, hot: self.hot, caffeine: self.caffeine)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func package() -> Package {
        return .carton
    }

}
