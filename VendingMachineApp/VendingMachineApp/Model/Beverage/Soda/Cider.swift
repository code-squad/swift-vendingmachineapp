//
//  Cider.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Cider: Soda {
    private var flavor: Flavor
    let flavorString = "flavor"
    
    enum Flavor: String {
        case apple = "apple"
        case lemon = "lemon"
    }
    
    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date, sugarRatio: SugarRatio, temperature: Int, flavor: Flavor) {
        self.flavor = flavor
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, sugarRatio: sugarRatio, temperature: temperature)
    }
    
      required init?(coder: NSCoder) {
        guard let flavor = Flavor(rawValue: (coder.decodeObject(forKey: flavorString) as? String)!) else { return nil }
        self.flavor = flavor
        super.init(coder: coder)
      }
      
      override func encode(with coder: NSCoder) {
          super.encode(with: coder)
        coder.encode(self.flavor.rawValue, forKey: flavorString)
      }
}
