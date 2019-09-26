//
//  Cider.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Cider: SoftDrink {
    private let lemonScentContent: Int
    
    init(lemonScentContent: Int = 10) {
        self.lemonScentContent = lemonScentContent
        
        super.init(
            brand: "코카콜라컴퍼니",
            capacity: 250,
            price: 1900,
            name: "스프라이트",
            dateOfManufactured: Date("20190219"),
            temperature: 20,
            shelfLife: 29,
            calorie: 200
        )
    }
}
