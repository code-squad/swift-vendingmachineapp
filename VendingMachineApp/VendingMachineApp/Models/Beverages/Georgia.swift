//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class Georgia: Coffee {
    private(set) var containsMilk: Bool
    
    init(manufacturer: String = "코카콜라",
         size: Int = 250,
         price: Int = 1300,
         name: String = "조지아 오리지널",
         caffeineContent: Int = 120,
         temperature: Int = 5,
         containsMilk: Bool = false) {
        self.containsMilk = containsMilk
        super.init(manufacturer: manufacturer,
                   size: size, price: price,
                   name: name,
                   caffeineContent: caffeineContent,
                   temperature: temperature)
    }
    
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        hasher.combine(containsMilk)
    }
}
