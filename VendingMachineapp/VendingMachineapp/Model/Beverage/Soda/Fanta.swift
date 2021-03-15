//
//  Hwanta.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/26.
//

import Foundation

class Fanta: Soda {
    private var color: String
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, flavor: String, color: String) {
        self.color = color
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
                   flavor: "Fanta",
                   color: "Orange")
    }
    
    required init?(coder: NSCoder) {
        self.color = coder.decodeObject(forKey: "color") as? String ?? String()
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(color, forKey: "color")
        super.encode(with: coder)
    }
    
    override var description: String {
        return "Fanta(\(color))-(\(super.description))"
    }
}
