//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    private let chocolateContent: Int
    
    init(chocolateContent: Int = 80) {
        self.chocolateContent = chocolateContent
        
        super.init(
            brand: "매일유업",
            capacity: 235,
            price: 2000,
            name: "초코우유",
            dateOfManufactured: Date("20190811"),
            temperature: 40,
            shelfLife: 3,
            calciumContent: 3
        )
    }
}
