//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    private var temperature: Int
    
    override init(name: String, price: Int, country: String) {
        self.temperature = 90
        super.init(name: name, price: price, country: country)
    }
    
    convenience init() {
        self.init(name: DefaultData.cantata.name, price: DefaultData.cantata.price, country: "인도네시아")
    }
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.temperature = try container.decode(Int.self)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(temperature)
        try super.encode(to: encoder)
    }
}
