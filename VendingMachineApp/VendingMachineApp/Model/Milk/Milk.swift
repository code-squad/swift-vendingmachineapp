//
//  Milk.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var farmCode: Int
    
    init(name: String, price: Int, farmCode: Int) {
        self.farmCode = farmCode
        super.init(name: name, price: price)
    }
    
    convenience init() {
        self.init(name: DefaultData.milk.name, price: DefaultData.milk.price, farmCode: 100)
    }
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.farmCode = try container.decode(Int.self)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(farmCode)
        try super.encode(to: encoder)
    }
}
