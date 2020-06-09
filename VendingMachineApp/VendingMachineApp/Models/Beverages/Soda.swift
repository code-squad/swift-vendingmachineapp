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
    
    init(sodaBuilder: SodaBuilder) {
        self.kiloCalorie = sodaBuilder.kiloCalorie
        super.init(builder: sodaBuilder)
    }
    
    func isLowCalorie() -> Bool {
        return kiloCalorie <= Quantity.maxLowKiloCalorie
    }
}

extension Soda {
    override var description: String {
        return super.description + ", \(kiloCalorie)kcal"
    }
}

extension Soda {
    class SodaBuilder: Beverage.Builder {
        
        let kiloCalorie: Int
        
        init(brand: String,
             name: String,
             volume: Int,
             price: Int,
             kiloCalorie: Int) {
            self.kiloCalorie = kiloCalorie
            super.init(brand: brand,
                       name: name,
                       volume: volume,
                       price: price)
        }
    }
}
