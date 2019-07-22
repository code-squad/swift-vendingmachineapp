//
//  HotSix.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class HotSix : EnergyDrink {
    private var taurine: Double
    init(
            brand: String,
            quantity: Int,
            price: Int,
            name: String,
            date: Date,
            sugar: Int?,
            coffeine: Double = 100,
            taurine: Double,
            calorySet: CaloryElements,
            temp temperature : Double
        ){
        self.taurine = taurine
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, sugar: sugar, coffeine: coffeine, calorySet: calorySet, temp: temperature)
    }
}
