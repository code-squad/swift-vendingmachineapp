//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private let strawberryContent: Double
    
    init(brand: String = "서울우유", capacity: Int = 200, price: Int = 1000, name: String = "딸기우유", expirationDate: Date = Date("20191023"), temperature: Int = 12, fatContent: Double = 3, strawberryContent: Double = 1) {
        self.strawberryContent = strawberryContent
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, expirationDate: expirationDate, temperature: temperature, fatContent: fatContent)
    }
}
