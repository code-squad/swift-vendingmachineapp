//
//  Soda.swift
//  VendingMachine
//
//  Created by jang gukjin on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Product {
    private var calorie: Int

    init(capacity: Int, price: Int, name: String, stringDate: String, calorie: Int) {
        self.calorie = calorie
        super.init(brand: "코카", capacity: capacity, price: price, name: name, stringDate: stringDate)
    }

    func isLowCalorie() -> Bool {
        if calorie <= 100 {
            return true
        } else {
            return false
        }
    }
}
