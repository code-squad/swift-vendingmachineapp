//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Sprite: Soda {
    private var brand: String
    
    override init(name: String, price: Int, calorie: Int) {
        self.brand = "칠성사이다"
        super.init(name: name, price: price, calorie: calorie)
    }
    
    convenience init() {
        self.init(name: DefaultData.sprite.name, price: DefaultData.sprite.price, calorie: 50)
    }
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.brand = try container.decode(String.self)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(brand)
        try super.encode(to: encoder)
    }
}
