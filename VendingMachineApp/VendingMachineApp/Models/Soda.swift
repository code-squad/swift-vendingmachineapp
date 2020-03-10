//
//  Soda.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Soda: Beverage {
    
    private let kiloCalorie: Int
    
    init?(brand: String, volume: Int, price: Int,
          name: String, manufacturingDateInfo: String, kiloCalorie: Int) {
        self.kiloCalorie = kiloCalorie
        super.init(brand: brand, volume: volume, price: price,
                   name: name, manufacturingDateInfo: manufacturingDateInfo)
    }
    
    func isLowCalorie() -> Bool {
        guard kiloCalorie <= Quantity.maxLowKiloCalorie
            else {
                return false
        }
        return true
    }
    
}

extension Soda {
    
    override var description: String {
        return super.description + ", \(kiloCalorie)kcal"
    }
    
}
