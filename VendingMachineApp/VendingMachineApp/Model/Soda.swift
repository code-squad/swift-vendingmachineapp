//
//  Soda.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private let lowCalorie: Bool

    init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, lowCalorie: Bool) {
        self.lowCalorie = lowCalorie
        super.init(brand: brand, weight: weight, price: price, name: name, dateOfManufacture: dateOfManufacture)
    }

    func isLowCalorie() -> Bool {
        return lowCalorie
    }

}
