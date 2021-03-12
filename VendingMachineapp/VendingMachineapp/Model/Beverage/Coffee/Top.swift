//
//  Top.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class Top: Coffee {
    private var milkContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, caffeineContent: Int, milkContent: Int) {
        self.milkContent = milkContent
        super.init(manufacturer: manufacturer,
        volume: volume,
        price: price,
        brand: brand,
        manufactured: manufactured,
        expiry: expiry,
        calorie: calorie,
        temperature: temperature,
        caffeineContent: caffeineContent)
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
                   caffeineContent: 10,
                   milkContent: 20)
    }
    
    required init?(coder: NSCoder) {
        self.milkContent = coder.decodeInteger(forKey: "milkContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(milkContent, forKey: "milkContent")
        super.encode(with: coder)
    }
    
    override var description: String {
        return "Top(\(milkContent))-(\(super.description))"
    }
}
