//
//  Milk.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var milkGrade: MilkGrade?
    static let expiredays: Int = 7

    init(brand: String,
         volume: Int,
         price: Int,
         name: String,
         manufacturedDate: Date,
         hot: Bool = true ,
         milkGrade: MilkGrade? = nil,
         expiryPeriod: ExpirationPeriod = ExpirationPeriod(endDay: Milk.expiredays)) {
        self.milkGrade = .AMilkGrade
        super.init(
            brand: brand,
            volume: volume,
            price: price,
            name: name,
            manufacturedDate: manufacturedDate,
            expiryPeriod: expiryPeriod)
    }

    // Required Initializers
    required convenience init() {
        self.init(
            brand: "",
            volume: 0,
            price: 0,
            name: "",
            manufacturedDate: Date(),
            expiryPeriod: ExpirationPeriod(endDay: 0)
        )
    }

    func same(_ number: MilkGrade) -> Bool {
        return self.milkGrade == number
    }
}
