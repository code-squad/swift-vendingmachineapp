//
//  Fanta.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class Fanta: SoftDrink {
    private(set) var calorie: Int
    
    init(manufacturer: String = "코카콜라",
         size: Int = 185,
         price: Int = 900,
         name: String = "환타",
         bubbleIntensity: BubbleIntensity = .weak,
         calorie: Int = 100) {
        self.calorie = calorie
        super.init(manufacturer: manufacturer,
                   size: size,
                   price: price,
                   name: name,
                   bubbleIntensity: bubbleIntensity)
    }
    
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        hasher.combine(calorie)
    }
}
