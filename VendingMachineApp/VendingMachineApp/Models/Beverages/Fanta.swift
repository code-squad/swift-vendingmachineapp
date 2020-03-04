//
//  Fanta.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class Fanta: SoftDrink {
    
    enum Flavor {
        case grape
        case orange
        case strawberry
    }
    
    private(set) var flavor: Flavor
    
    init(manufacturer: String = "코카콜라",
         size: Int = 185,
         price: Int = 900,
         name: String = "환타",
         bubbleIntensity: BubbleIntensity = .weak,
         flavor: Flavor = .orange) {
        self.flavor = flavor
        super.init(manufacturer: manufacturer,
                   size: size,
                   price: price,
                   name: name,
                   bubbleIntensity: bubbleIntensity)
    }
}
