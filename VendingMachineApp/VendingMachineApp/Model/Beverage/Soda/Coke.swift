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
    
    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date, sugarRatio: SugarRatio, temperature: Int, cocaLeafRatio: Double) {
        self.cocaLeafRatio = cocaLeafRatio
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, sugarRatio: sugarRatio, temperature: temperature)
    }
    
    required init?(coder: NSCoder) {
        self.cocaLeafRatio = coder.decodeDouble(forKey: "cocaLeafRatio")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.cocaLeafRatio, forKey: "cocaLeafRatio")
    }
}
