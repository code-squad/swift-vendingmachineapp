//
//  Milk.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Milk: Beverage {
    private var fatRatio: FatRatio
    let fatRatioString = "fatRatio"
    
    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date, fatRatio: FatRatio, temperature: Int) {
        self.fatRatio = fatRatio
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, temperature: temperature)
    }

    enum FatRatio: Int {
        case original = 75
        case lower = 25
        case free = 0
    }
    
    required init?(coder: NSCoder) {
        guard let fatRatio = FatRatio(rawValue: coder.decodeInteger(forKey: fatRatioString)) else { return nil }
        self.fatRatio = fatRatio
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.fatRatio.rawValue, forKey: fatRatioString)
    }
}
