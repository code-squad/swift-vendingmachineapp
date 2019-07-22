//
//  Fanta.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Fanta: CarbonatedDrink {
    private (set) var fruitType: Fruit
    
    init(
            brand: String,
            quantity: Int,
            price: Int,
            name: String,
            date: Date,
            fruitType : Fruit = Fruit.purpleGrape,
            sugar: Int? = nil,
            calorySet: CaloryElements,
            temperature: Double
        ){
        self.fruitType = fruitType
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, sugar: sugar, calorySet: calorySet, temp: temperature)
    }
}
