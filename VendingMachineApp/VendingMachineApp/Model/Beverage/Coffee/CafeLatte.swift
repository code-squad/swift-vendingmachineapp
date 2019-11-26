//
//  CafeLatte.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CafeLatte: Coffee {
    private let milkRatio: Double
    
    init(brand: String = "동서식품", capacity: Int = 275, price: Int = 2200, name: String = "티오피 마스터 라떼", expirationDate: Date = Date("20201002"), temperature: Int = 21, bean: Bean = .arabica, milkRatio: Double = 15) {
        self.milkRatio = milkRatio
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, expirationDate: expirationDate, temperature: temperature, bean: bean)
    }
}
