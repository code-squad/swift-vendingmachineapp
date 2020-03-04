//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/04.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    let caffeineContent: Int
    let temperature: Int
    
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
}
