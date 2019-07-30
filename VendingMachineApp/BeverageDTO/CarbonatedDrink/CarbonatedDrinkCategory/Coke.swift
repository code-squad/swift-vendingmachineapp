//
//  Coke.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coke: CarbonatedDrink, Antihypnotical {
    private let coffeine: Double
    
    init(
            brand: String,
            quantity: Int,
            price: Int,
            name: String,
            date: Date,
            coffeine :Double = 100,
            sugar :Int?,
            calorySet: CaloryElements,
            temperature: Double
        ){
        self.coffeine = coffeine
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, sugar: sugar, calorySet: calorySet, temp:    temperature)
    }
    
    private enum CodingKeys: String, CodingKey {
        case coffeine
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        coffeine = try container.decode(Double.self, forKey: .coffeine)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    var coffeineDisplay: Double {
        get{
            return self.coffeine
        }
    }
}
