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
    
    let flavor: Flavor
    
    init(manufacturer: String,
         size: Int,
         price: Int,
         name: String,
         bubbleIntensity: BubbleIntensity,
         flavor: Flavor) {
        self.flavor = flavor
        super.init(manufacturer: manufacturer,
                   size: size,
                   price: price,
                   name: name,
                   bubbleIntensity: bubbleIntensity)
    }
}
