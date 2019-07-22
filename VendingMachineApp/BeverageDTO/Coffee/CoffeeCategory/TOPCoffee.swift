//
//  TOP.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class TOPCoffee: Coffee{
    private let coffeeType: CoffeeType

    init(
            brand: String,
            quantity: Int,
            price: Int,
            name: String,
            date: Date,
            coffeine: Double = 100.0,
            bean: CoffeeBean = CoffeeBean.arabica,
            type: CoffeeType = CoffeeType.americano,
            calorySet: CaloryElements,
            temperature: Double
        ){
        self.coffeeType = type
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, coffeine: coffeine, bean: bean, calorySet: calorySet, temp: temperature)
    }

    convenience init(brand: String, quantity: Int, price: Int, name: String, date: Date) {
        let coffeine: Double = 100.0
        let bean = CoffeeBean.arabica
        let coffeeType = CoffeeType.americano
        let calorySet = CaloryElements(carbon: 0, protein: 0, fat: 0 )
        let temp = 4.0
        self.init(brand: brand, quantity: quantity, price: price, name: name, date: date, coffeine: coffeine, bean: bean, type: coffeeType, calorySet: calorySet, temperature: temp)        
    }
}
