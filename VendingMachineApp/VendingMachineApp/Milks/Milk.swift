//
//  Milk.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private let lactose: Int

    init(lactose: Int, brand: String, size: Int, price: Int, name: String, expiryDate: Int) {
        self.lactose = lactose
        super.init(brand: brand, size: size, price: price, name: name, expiryDate: expiryDate)
    }

    func hasLactose() -> Bool {
        return self.lactose > 0
    }
}
