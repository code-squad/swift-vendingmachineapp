//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Coffee: CaffineBeverage {
    
    private var coffeeVarieties: String
    
    public init(
        brand: String,
        weight: Int,
        price: Int,
        name: String,
        dateOfManufacture: Date,
        temperature: Double,
        caffine: Double,
        calorie: Double,
        coffeeVarieties: String
    ) {
        self.coffeeVarieties = coffeeVarieties
        super.init(
            brand: brand,
            weight: weight,
            price: price,
            name: name,
            dateOfManufacture: dateOfManufacture,
            temperature: temperature,
            calorie: calorie,
            caffine: caffine
        )
    }
}
