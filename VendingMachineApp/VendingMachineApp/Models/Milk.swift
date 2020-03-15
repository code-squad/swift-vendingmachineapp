//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Milk: Beverage {
    
    enum Falvor: String {
        case choco
        case banana
    }
    
    private var flavor: Falvor
    
    public init(
        brand: Brand,
        weight: Int,
        price: Int,
        name: String,
        expirationDate: Date,
        temperature: Double,
        calorie: Double,
        flavor: Falvor
    ) {
        self.flavor = flavor
        super.init(
            brand: brand,
            weight: weight,
            price: price,
            name: name,
            expirationDate: expirationDate,
            temperature: temperature,
            calorie: calorie
        )
    }
}
