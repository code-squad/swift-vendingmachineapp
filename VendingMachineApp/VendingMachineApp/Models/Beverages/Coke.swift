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
    
    init(manufacturer: String = "코카콜라",
         size: Int = 355,
         price: Int = 1600,
         name: String = "코카콜라",
         bubbleIntensity: BubbleIntensity = .strong,
         isDietCoke: Bool = false) {
        self.isDietCoke = isDietCoke
        super.init(manufacturer: manufacturer,
                   size: size,
                   price: price,
                   name: name,
                   bubbleIntensity: bubbleIntensity)
    }
    
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        hasher.combine(isDietCoke)
    }
}
