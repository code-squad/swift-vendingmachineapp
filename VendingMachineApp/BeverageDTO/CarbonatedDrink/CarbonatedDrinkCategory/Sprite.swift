//
//  Sprite.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Sprite: CarbonatedDrink {
    private (set) var lowSugary: Bool
    
    init(
            brand: String,
            quantity: Int,
            price: Int,
            name: String,
            date: Date,
            sugar: Int? = nil,
            lowSugary: Bool = false,
            calorySet: CaloryElements,
            temperature: Double
        ){
        self.lowSugary = lowSugary
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, sugar: sugar, calorySet: calorySet, temp:  temperature)
    }
}
