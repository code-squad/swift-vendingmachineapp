//
//  Americano.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Americano: Coffee {
      private var coffeeBean: String
        
    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date, isContainMilk: Bool, package: Packages, temperature: Int, coffeeBean: String) {
            self.coffeeBean = coffeeBean
            super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, package: package, temperature: temperature)
            
        }
    }
