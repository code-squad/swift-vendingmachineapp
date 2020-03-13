//
//  Coke.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Coke: Soda {
    private var cocaLeafRatio: Double
    let cocaLeafRatioString = "cocaLeafRatio"
    
    init (manufacturer: String = "", brand: String = "", capacity: Int = 0, price: Money = Money(), name: String = "", manufacturedDate: Date = Date(), expirationDate: Date = Date(), sugarRatio: SugarRatio = .original, temperature: Int = 0, cocaLeafRatio: Double = 0.0) {
        self.cocaLeafRatio = cocaLeafRatio
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, sugarRatio: sugarRatio, temperature: temperature)
    }
    
    required init?(coder: NSCoder) {
        self.cocaLeafRatio = coder.decodeDouble(forKey: cocaLeafRatioString)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.cocaLeafRatio, forKey: cocaLeafRatioString)
    }
}
