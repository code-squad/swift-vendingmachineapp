//
//  CarbonatedDrink.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CarbonatedDrink: Beverage {
    private let calorie: Int

    init(calorie: Int, brand: String, size: Int, price: Int, name: String, expiryDate: Int) {
        self.calorie = calorie
        super.init(brand: brand, size: size, price: price, name: name, expiryDate: expiryDate)
    }

    func isLowCalorie() -> Bool {
        return self.calorie < 10
    }
}
