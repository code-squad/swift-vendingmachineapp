//
//  Coke.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coke: Soda {
    private var calorie: Int = 110
    convenience init() {
        self.init(brand: "", weight: 0, price: 0, name: "", manufactureDate: Date(), calorie: 1)
    }
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, calorie: Int) {
        self.calorie = calorie
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.kindOf = "콜라"
    }
    
    func isLowCalorie() -> Bool {
        return calorie < 80
    }
}
