//
//  Americano.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Americano: Coffee {
    private let waterContent: Int
    
    init(waterContent: Int = 70) {
        self.waterContent = waterContent
        
        super.init(
            brand: "맥심커피",
            capacity: 400,
            price: 3000,
            name: "TOP아메리카노",
            dateOfManufactured: Date("20190812"),
            temperature: 10,
            shelfLife: 3,
            bean: .arabica
        )
    }
    
    enum Keys: String {
        case waterContent = "WaterContent"
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(waterContent, forKey: Keys.waterContent.rawValue)
        
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.waterContent = coder.decodeInteger(forKey: Keys.waterContent.rawValue)
        
        super.init(coder: coder)
    }
}
