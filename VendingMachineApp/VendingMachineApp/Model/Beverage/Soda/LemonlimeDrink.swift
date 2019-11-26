//
//  LemonlimeDrink.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class LemonlimeDrink: Soda {
    private let lemonScentContent: Double
    
    init(brand: String = "코카콜라", capacity: Int = 215, price: Int = 1300, name: String = "스프라이트", expirationDate: Date = Date("20101001"), temperature: Int = 7, sugarContent: Double = 24, lemonScentContent: Double = 1) {
        self.lemonScentContent = lemonScentContent
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, expirationDate: expirationDate, temperature: temperature, sugarContent: sugarContent)
    }
}

