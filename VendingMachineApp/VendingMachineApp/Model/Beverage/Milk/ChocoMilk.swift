//
//  ChocoMilk.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class ChocoMilk: Milk {
    private var chocolateRatio: Double
    let chocolateRatioString = "chocolateRatio"
    
    init(manufacturer: String = "", brand: String = "", capacity: Int = 0, price: Money = Money(), name: String = "", manufacturedDate: Date = Date(), expirationDate: Date = Date(), fatRatio: FatRatio = .original, isLactoFree: Bool = false, temperature: Int = 0, chocolateRatio: Double = 0.0) {
        self.chocolateRatio = chocolateRatio
           super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, fatRatio: fatRatio,temperature: temperature)
       }
    
    required init?(coder: NSCoder) {
         self.chocolateRatio = coder.decodeDouble(forKey: chocolateRatioString)
         super.init(coder: coder)
     }
     
     override func encode(with coder: NSCoder) {
         super.encode(with: coder)
         coder.encode(self.chocolateRatio, forKey: chocolateRatioString)
     }
}
