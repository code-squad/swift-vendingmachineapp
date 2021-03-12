//
//  StrawberryMilk.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class StrawberryMilk: Milk {
    private var strawberryContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, lowFat: Int, strawberryContent: Int) {
        self.strawberryContent = strawberryContent
        super.init(manufacturer: manufacturer,
        volume: volume,
        price: price,
        brand: brand,
        manufactured: manufactured,
        expiry: expiry,
        calorie: calorie,
        temperature: temperature,
        lowFat: lowFat)
    }
    
    required convenience init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int) {
        self.init(manufacturer: manufacturer,
                   volume: volume,
                   price: price,
                   brand: brand,
                   manufactured: manufactured,
                   expiry: expiry,
                   calorie: calorie,
                   temperature: temperature,
                   lowFat: 13,
                   strawberryContent: 20)
    }
    
    required init?(coder: NSCoder) {
        self.strawberryContent = coder.decodeInteger(forKey: "strawberryContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(strawberryContent, forKey: "strawberryContent")
        super.encode(with: coder)
    }
    
    override var description: String {
        return "StrawberryMilk(\(strawberryContent))-(\(super.description))"
    }
}
