//
//  Coffee.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let bean: Bean
    
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufactured: Date, temperature: Int, shelfLife: Double, bean: Bean) {
        self.bean = bean
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufactured: dateOfManufactured, temperature: temperature, shelfLife: shelfLife)
    }
    
    enum Bean {
        case robusta
        case arabica
        case liberica
    }
}
