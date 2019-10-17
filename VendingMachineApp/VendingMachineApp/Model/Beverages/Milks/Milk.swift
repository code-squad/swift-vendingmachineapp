//
//  Milk.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private let calciumContent: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufactured: Date, temperature: Int, shelfLife: Double, calciumContent: Int) {
        self.calciumContent = calciumContent
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufactured: dateOfManufactured, temperature: temperature, shelfLife: shelfLife)
    }
    
    var isHighCalcium: Bool {
        return calciumContent > BeverageStandard.calcium
    }
    
    enum Keys: String {
        case calciumContent = "CalciumContent"
    }

    override func encode(with coder: NSCoder) {
        coder.encode(calciumContent, forKey: Keys.calciumContent.rawValue)
        
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.calciumContent = coder.decodeInteger(forKey: Keys.calciumContent.rawValue)
        
        super.init(coder: coder)
    }
}
