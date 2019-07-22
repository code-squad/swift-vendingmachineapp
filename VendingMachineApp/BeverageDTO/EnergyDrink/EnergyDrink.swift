//
//  EnergyDrink.swift
//  VendingMachine
//
//  Created by hw on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class EnergyDrink: Drink, Antihypnotical, SugaryContainable {    
    private let coffeine: Double
    private var sugar: Int?
    
    init(
            brand: String,
            quantity: Int,
            price: Int,
            name: String,
            date: Date,
            sugar: Int?,
            coffeine: Double = 100,
            calorySet: CaloryElements,
            temp: Double
        ){
        self.sugar = sugar
        self.coffeine = coffeine
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, caloryElements: calorySet, temp: temp)
    }
    
    var coffeineDisplay: Double {
        get {
            return self.coffeine
        }
    }
    var sugary: Int {
        get {
            switch sugar {
            case .none:
                return 0
            case .some(_):
                return sugar!
            }
        }
    }
}
