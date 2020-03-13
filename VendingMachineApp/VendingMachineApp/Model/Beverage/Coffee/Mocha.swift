//
//  Mocha.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Mocha: Coffee {
    private var wheepCreamAmount: Int
    let wheepCreamAmountString = "wheepCreamAmount"
    
    init(manufacturer: String = "", brand: String = "", capacity: Int = 0, price: Money = Money(), name: String = "", manufacturedDate: Date = Date(), expirationDate: Date = Date(), package: Packages = .can, temperature: Int = 0, wheepCreamAmount: Int = 0) {
        self.wheepCreamAmount = wheepCreamAmount
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, package: package, temperature: temperature)
        
    }
    
    required init?(coder: NSCoder) {
        self.wheepCreamAmount = coder.decodeInteger(forKey: wheepCreamAmountString)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.wheepCreamAmount, forKey: wheepCreamAmountString)
    }
}
