//
//  Coffee.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class Coffee: Beverage {
    private var caffeineContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, caffeineContent: Int) {
        self.caffeineContent = caffeineContent
        super.init(manufacturer: manufacturer,
        volume: volume,
        price: price,
        brand: brand,
        manufactured: manufactured,
        expiry: expiry,
        calorie: calorie,
        temperature: temperature)
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
                   caffeineContent: 0)
    }
    
    required init?(coder: NSCoder) {
        self.caffeineContent = coder.decodeInteger(forKey: "caffeineContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(caffeineContent, forKey: "caffeineContent")
        super.encode(with: coder)
    }
    
    override var description: String {
        return "Coffee(\(caffeineContent))-(\(super.description))"
    }
}
