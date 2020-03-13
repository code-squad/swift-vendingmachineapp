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
    
    init(manufacturer: String = "", brand: String = "", capacity: Int = 0, price: Money = Money(), name: String = "", manufacturedDate: Date = Date(), expirationDate: Date = Date(), sugarRatio: SugarRatio = .original, temperature: Int = 0, flavor: Flavor = .apple)  {
        self.flavor = flavor
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, sugarRatio: sugarRatio, temperature: temperature)
    }
    
      required init?(coder: NSCoder) {
        let decodedString = coder.decodeObject(forKey: flavorString) as? String
        let flavor = Flavor(rawValue: decodedString ?? "")
        self.flavor = flavor ?? Flavor.apple
        super.init(coder: coder)
      }
      
      override func encode(with coder: NSCoder) {
          super.encode(with: coder)
        coder.encode(self.flavor.rawValue, forKey: flavorString)
      }
}
