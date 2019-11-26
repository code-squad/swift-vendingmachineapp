//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    private let chocolateContent: Double
    
    init(brand: String = "서울우유", capacity: Int = 200, price: Int = 1000, name: String = "초코우유", expirationDate: Date = Date("20200123"), temperature: Int = 10, fatContent: Double = 3, chocolateContent: Double = 1) {
        self.chocolateContent = chocolateContent
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, expirationDate: expirationDate, temperature: temperature, fatContent: fatContent)
    }
}
