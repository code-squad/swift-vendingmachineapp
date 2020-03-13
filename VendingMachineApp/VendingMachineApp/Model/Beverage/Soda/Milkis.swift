//
//  Milkis.swift
//  VendingMachineApp
//
//  Created by delma on 2020/03/07.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Milkis: Soda {
    private var milkRatio: Double
    let milkRatioString = "milkRatio"
    
    init(manufacturer: String = "", brand: String = "", capacity: Int = 0, price: Money = Money(), name: String = "", manufacturedDate: Date = Date(), expirationDate: Date = Date(), sugarRatio: SugarRatio = .original, temperature: Int = 0, milkRatio: Double = 0.0) {
        self.milkRatio = milkRatio
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, sugarRatio: sugarRatio, temperature: temperature)
    }
    
    required init?(coder: NSCoder) {
        self.milkRatio = coder.decodeDouble(forKey: milkRatioString)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.milkRatio, forKey: milkRatioString)
    }
}
