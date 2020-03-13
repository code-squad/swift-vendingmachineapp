//
//  Latte.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Latte: Coffee {
      private var sugarAmount: Int
      let sugarAmountString = "sugarAmount"
    
      init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date, isContainMilk: Bool, package: Packages, temperature: Int, sugarAmount: Int) {
          self.sugarAmount = sugarAmount
          super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, package: package, temperature: temperature)
          
      }
    
    required init?(coder: NSCoder) {
        self.sugarAmount = coder.decodeInteger(forKey: sugarAmountString)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.sugarAmount, forKey: sugarAmountString)
    }
}
