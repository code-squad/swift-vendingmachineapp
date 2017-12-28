//
//  Milk.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var validate: Date

    init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, validate: Date) {
        self.validate = validate
        super.init(brand: brand, weight: weight, price: price, name: name, dateOfManufacture: dateOfManufacture)
    }

    func validate(with data: Date) -> Bool {
        return data < validate
    }

}
