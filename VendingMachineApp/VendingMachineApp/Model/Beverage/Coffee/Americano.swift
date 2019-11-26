//
//  Americano.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Americano: Coffee {
    private let espressoRatio: Double
    
    init(brand: String = "동서식품", capacity: Int = 275, price: Int = 2200, name: String = "티오피 더블랙", expirationDate: Date = Date("20191001"), temperature: Int = 22, bean: Bean = .arabica, espressoRatio: Double = 12.6) {
        self.espressoRatio = espressoRatio
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, expirationDate: expirationDate, temperature: temperature, bean: bean)
    }
}
