//
//  Georgia.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class GeorgiaCoffee: Coffee{
    private let model : String
    private let coffeeType: CoffeeType

    init(
            brand: String,
            quantity: Int,
            price: Int,
            name: String,
            date: Date,
            coffeine: Double = 100.0,
            bean: CoffeeBean = CoffeeBean.arabica,
            model: String = "정우성",
            coffeeType: CoffeeType = CoffeeType.americano,
            calorySet: CaloryElements,
            temperature: Double
        ){
        self.model = model
        self.coffeeType = coffeeType
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, coffeine: coffeine, bean: bean, calorySet: calorySet, temp: temperature )
    }
}
