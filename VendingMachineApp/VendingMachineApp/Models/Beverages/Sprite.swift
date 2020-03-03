//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class Sprite: SoftDrink {
    
    enum Container {
        case bottle
        case can
        case pet
    }
    
    let container: Container
    
    init(manufacturer: String,
         size: Int,
         price: Int,
         name: String,
         bubbleIntensity: BubbleIntensity,
         container: Container) {
        self.container = container
        super.init(manufacturer: manufacturer,
                   size: size,
                   price: price,
                   name: name,
                   bubbleIntensity: bubbleIntensity)
    }
}
