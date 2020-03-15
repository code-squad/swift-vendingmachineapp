//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Coffee: CaffineBeverage {
    
    enum CoffeeVarieties {
        case keyna
        case Ethiopia
    }
    
    private var coffeeVarieties: CoffeeVarieties
    
    public init(
        brand: Brand,
        weight: Int,
        price: Int,
        name: String,
        expirationDate: Date,
        temperature: Double,
        caffine: Double,
        calorie: Double,
        coffeeVarieties: CoffeeVarieties
    ) {
        self.coffeeVarieties = coffeeVarieties
        super.init(
            brand: brand,
            weight: weight,
            price: price,
            name: name,
            expirationDate: expirationDate,
            temperature: temperature,
            calorie: calorie,
            caffine: caffine
        )
    }
}
