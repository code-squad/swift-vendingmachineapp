//
//  FatBeverage.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class OilBeverage: Beverage {
    
    private var fat: Bool
    public var category: String {
        fat ? "지방" : "저지방"
    }
    
    public init(
        brand: String,
        weight: Int,
        price: Int,
        name: String,
        dateOfManufacture: Date,
        temperature: Double,
        calorie: Double,
        fat: Bool
    ) {
        self.fat = fat
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
