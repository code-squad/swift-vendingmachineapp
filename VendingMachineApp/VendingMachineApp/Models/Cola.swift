//
//  Cola.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Cola: CarbonicAcidBeverage {
    
    private var sugar: Bool
    public var category: String {
        sugar ? "일반" : "다이어트"
    }
    
    public init(
        brand: String,
        weight: Int,
        price: Int,
        name: String,
        dateOfManufacture: Date,
        temperature: Double,
        calorie: Double,
        concentration: Double,
        sugar: Bool
    ) {
        self.sugar = sugar
        super.init(
            brand: brand,
            weight: weight,
            price: price,
            name: name,
            dateOfManufacture: dateOfManufacture,
            temperature: temperature,
            calorie: calorie,
            concentration: concentration
        )
    }
}



