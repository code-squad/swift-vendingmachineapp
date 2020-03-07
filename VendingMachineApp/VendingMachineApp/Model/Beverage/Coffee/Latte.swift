//
//  Latte.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Latte: Coffee {
      private var isContainSugar: Bool
      
      init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date, isContainMilk: Bool, package: Packages, temperature: Int, isContainSugar: Bool) {
          self.isContainSugar = isContainSugar
          super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, package: package, temperature: temperature)
          
      }
    
}
