//
//  Coffee.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let bean: Bean
    
    init(brand: String, capacity: Int, price: Int, name: String, expirationDate: Date, temperature: Int, bean: Bean = .arabica) {
        self.bean = bean
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, expirationDate: expirationDate, temperature: temperature)
    }
}

//Bean
extension Coffee {
    enum Bean {
        case arabica
        case robusta
        case liberica
    }
}
