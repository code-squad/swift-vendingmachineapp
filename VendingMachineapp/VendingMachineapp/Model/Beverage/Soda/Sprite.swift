//
//  Sprite.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class Sprite: Soda {
    private var lemonContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, flavor: String, lemonContent: Int) {
        self.lemonContent = lemonContent
        super.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expiry: expiry,
                   calorie: calorie,
                   temperature: temperature,
                   flavor: flavor)
    }
    
    override convenience init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, flavor: String) {
        self.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expiry: expiry,
                   calorie: calorie,
                   temperature: temperature,
                   flavor: "Sprite",
                   lemonContent: 12)
    }
    
    required init?(coder: NSCoder) {
        self.lemonContent = coder.decodeInteger(forKey: "lemonContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(lemonContent, forKey: "lemonContent")
        super.encode(with: coder)
    }
    
    override var description: String {
        return "Sprite(\(lemonContent))-(\(super.description))"
    }
}
