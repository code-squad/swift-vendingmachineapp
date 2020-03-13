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
    let bananaCountryString = "bananaCountry"
    
    init(manufacturer: String = "", brand: String = "", capacity: Int = 0, price: Money = Money(), name: String = "", manufacturedDate: Date = Date(), expirationDate: Date = Date(), fatRatio: FatRatio = .original, isLactoFree: Bool = false, temperature: Int = 0, bananaCountry: String = "") {
        self.bananaCountry = bananaCountry
           super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, fatRatio: fatRatio,  temperature: temperature)
       }
    
    required init?(coder: NSCoder) {
        guard let bananaCountry = coder.decodeObject(forKey: bananaCountryString) as? String else { return nil }
         self.bananaCountry = bananaCountry
         super.init(coder: coder)
     }
     
     override func encode(with coder: NSCoder) {
         super.encode(with: coder)
         coder.encode(self.bananaCountry, forKey: bananaCountryString)
     }
}
