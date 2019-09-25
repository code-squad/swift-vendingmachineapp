//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private let strawberryContent: Int
    
    init(strawberryContent: Int = 20) {
        self.strawberryContent = strawberryContent
        
        super.init(
            brand: "서울우유",
            capacity: 200,
            price: 1000,
            name: "딸기우유",
            dateOfManufactured: Date("20190812"),
            temperature: 10,
            shelfLife: 7,
            calciumContent: 1
        )
    }
}
