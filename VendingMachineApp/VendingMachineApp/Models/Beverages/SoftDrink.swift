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
    
    let bubbleIntensity: BubbleIntensity
    
    init(manufacturer: String, size: Int, price: Int, name: String, bubbleIntensity: BubbleIntensity) {
        self.bubbleIntensity = bubbleIntensity
        super.init(manufacturer: manufacturer, size: size, price: price, name: name)
    }
}
