//
//  Cola.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Cola: CarbonicAcidBeverage {
    
    private var sugar: Double
    
    public init(
        brand: Brand,
        weight: Int,
        price: Int,
        name: String,
        expirationDate: Date,
        temperature: Double,
        calorie: Double,
        concentration: Double,
        sugar: Double
    ) {
        self.sugar = sugar
        super.init(
            brand: brand,
            weight: weight,
            price: price,
            name: name,
            expirationDate: expirationDate,
            temperature: temperature,
            calorie: calorie,
            concentration: concentration
        )
    }
    
    public func category(standard: Double) -> String {
        sugar > standard ? "일반" : "다이어트"
    }
}



