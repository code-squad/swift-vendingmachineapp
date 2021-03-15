//
//  Soda.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

class Soda: Beverage {
    private var flavor: String
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, flavor: String) {
        self.flavor = flavor
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
                   flavor: "unknown")
    }
    
    required init?(coder: NSCoder) {
        self.flavor = coder.decodeObject(forKey: "flavor") as? String ?? String()
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(flavor, forKey: "flavor")
        super.encode(with: coder)
    }
    
    override var description: String {
        return "Soda(\(flavor))-(\(super.description))"
    }
}
