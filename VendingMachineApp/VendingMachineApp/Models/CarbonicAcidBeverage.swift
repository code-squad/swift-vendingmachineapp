//
//  CarbonicAcidBeverage.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class CarbonicAcidBeverage: Beverage {
    
    private var concentration: Double
    
    public init(
        brand: String,
        weight: Int,
        price: Int,
        name: String,
        dateOfManufacture: Date,
        temperature: Double,
        calorie: Double,
        concentration: Double
    ) {
        self.concentration = concentration
        super.init(
            brand: brand,
            weight: weight,
            price: price,
            name: name,
            dateOfManufacture: dateOfManufacture,
            temperature: temperature,
            calorie: calorie
        ) 
    }
}
