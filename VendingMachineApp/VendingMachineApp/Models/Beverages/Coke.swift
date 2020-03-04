//
//  Coke.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class Coke: SoftDrink {
    private(set) var isDietCoke: Bool
    
    init(manufacturer: String,
         size: Int,
         price: Int,
         name: String,
         bubbleIntensity: BubbleIntensity,
         isDietCoke: Bool) {
        self.isDietCoke = isDietCoke
        super.init(manufacturer: manufacturer,
                   size: size,
                   price: price,
                   name: name,
                   bubbleIntensity: bubbleIntensity)
    }
}
