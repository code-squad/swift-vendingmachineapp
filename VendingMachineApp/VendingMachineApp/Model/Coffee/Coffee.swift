//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var country: String
    
    init(name: String, price: Int, country: String) {
        self.country = country
        super.init(name: name, price: price)
    }
    
    convenience init() {
        self.init(name: DefaultData.coffee.name, price: DefaultData.coffee.price, country: "콜롬비아")
    }
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.country = try container.decode(String.self)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(country)
        try super.encode(to: encoder)
    }
}
