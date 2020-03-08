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
    
    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date, fatRatio: FatRatio, isLactoFree: Bool, temperature: Int, chocolateRatio: Double) {
        self.chocolateRatio = chocolateRatio
           super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, fatRatio: fatRatio,temperature: temperature)
       }
}
