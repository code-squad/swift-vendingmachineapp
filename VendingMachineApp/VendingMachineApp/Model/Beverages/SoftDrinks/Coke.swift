//
//  Coke.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coke: SoftDrink {
    private let caffeineContent: Int
    
    init(caffeineContent: Int = 5) {
        self.caffeineContent = caffeineContent
        
        super.init(
            brand: "코카콜라컴퍼니",
            capacity: 250,
            price: 1900,
            name: "콜라",
            dateOfManufactured: Date("20190630"),
            temperature: 10,
            shelfLife: 12,
            calorie: 160
        )
    }
}
