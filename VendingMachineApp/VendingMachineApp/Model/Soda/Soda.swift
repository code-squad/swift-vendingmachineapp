//
//  Soda.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private var calorie: Int
    
    init(name: String, price: Int, calorie: Int) {
        self.calorie = calorie
        super.init(name: name, price: price)
    }
    
    convenience init() {
        self.init(name: DefaultData.soda.name, price: DefaultData.soda.price, calorie: 0)
    }
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.calorie = try container.decode(Int.self)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(calorie)
        try super.encode(to: encoder)
    }
}
