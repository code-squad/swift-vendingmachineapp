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
    
    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date, fatRatio: FatRatio, isLactoFree: Bool, temperature: Int, bananaCountry: String) {
        self.bananaCountry = bananaCountry
           super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, fatRatio: fatRatio,  temperature: temperature)
       }
    
    required init?(coder: NSCoder) {
        guard let bananaCountry = coder.decodeObject(forKey: "bananaCountry") as? String else { return nil }
         self.bananaCountry = bananaCountry
         super.init(coder: coder)
     }
     
     override func encode(with coder: NSCoder) {
         super.encode(with: coder)
         coder.encode(self.bananaCountry, forKey: "bananaCountry")
     }
}
