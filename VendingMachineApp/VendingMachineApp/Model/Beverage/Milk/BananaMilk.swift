//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class BananMilk: Milk {
    private var bananaCountry: String
    
    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date, fatRatio: FatRatio, isLactoFree: Bool, temperature: Int, bananaCountry: String) {
        self.bananaCountry = bananaCountry
           super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, fatRatio: fatRatio,  temperature: temperature)
       }
}
