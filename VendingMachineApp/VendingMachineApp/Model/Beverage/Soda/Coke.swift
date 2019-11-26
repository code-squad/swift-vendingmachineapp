//
//  Coke.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coke: Soda {
    private let caffeineContent: Double
    
    init(brand: String = "코카콜라", capacity: Int = 210, price: Int = 1100, name: String = "코카콜라", expirationDate: Date = Date("20200101"), temperature: Int = 10, sugarContent: Double = 23, caffeineContent: Double = 16) {
        self.caffeineContent = caffeineContent
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, expirationDate: expirationDate, temperature: temperature, sugarContent: sugarContent)
    }
}
