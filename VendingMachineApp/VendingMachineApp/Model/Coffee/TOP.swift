//
//  TOP.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class TOP: Coffee {
    enum Flavor {
        case americano
        case latte
        case espresso
    }
    
    private var flavor: Flavor
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date, expirationAt: Date, temperature: Double, caffeineContent: Double, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt, expirationAt: expirationAt, temperature: temperature, caffeineContent: caffeineContent)
    }
    
    func isEspresso() -> Bool {
        return self.flavor == Flavor.espresso
    }
}
