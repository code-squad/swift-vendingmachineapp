//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/04.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let caffeineContent: Int
    private let temperature: Int
    
    init(manufacturer: String,
         size: Int,
         price: Int,
         name: String,
         caffeineContent: Int,
         temperature: Int) {
        self.caffeineContent = caffeineContent
        self.temperature = temperature
        super.init(manufacturer: manufacturer, size: size, price: price, name: name)
    }
    
    func canReplaceEnergyDrinks(threshold: Int) -> Bool {
        return caffeineContent > threshold
    }
    
    func isHot(threshold: Int) -> Bool {
        return temperature > threshold
    }
    
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        hasher.combine(caffeineContent)
        hasher.combine(temperature)
    }
    
    override func isEqual(to rhs: Beverage) -> Bool {
        return rhs is Coffee
            && hashValue == rhs.hashValue
    }
}
