//
//  CaffeLatte.swift
//  VendingMachine
//
//  Created by CHOMINJI on 13/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CaffeLatte: Coffee {
    private let milkContent: Int
    
    init(milkContent: Int = 20) {
        self.milkContent = milkContent
        
        super.init(
            brand: "롯데",
            capacity: 275,
            price: 3500,
            name: "칸타타카페라떼",
            dateOfManufactured: Date("20190719"),
            temperature: 70,
            shelfLife: 2,
            bean: .robusta
        )
    }
}
