//
//  SoftDrink.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/03.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class SoftDrink: Beverage {
    
    enum BubbleIntensity {
        case strong
        case medium
        case weak
    }
    
    private(set) var bubbleIntensity: BubbleIntensity
    
    init(manufacturer: String, size: Int, price: Int, name: String, bubbleIntensity: BubbleIntensity) {
        self.bubbleIntensity = bubbleIntensity
        super.init(manufacturer: manufacturer, size: size, price: price, name: name)
    }
    
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        hasher.combine(bubbleIntensity)
    }
    
    override func isEqual(to rhs: Beverage) -> Bool {
        return rhs is SoftDrink
            && hashValue == rhs.hashValue
    }
}
