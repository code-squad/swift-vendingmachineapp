//
//  SoftDrink.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/26.
//

import Foundation

class SoftDrink: Beverage {
    enum BubbleIntensity {
        case high
        case low
    }
    
    private let bubbleIntensity: BubbleIntensity
    
    init(brand: String, capacity: Int, price: Int, name: String, expireDate: String, caffeineContent: Int, bubbleIntensity: BubbleIntensity) {
        self.bubbleIntensity = bubbleIntensity
        super.init(brand: brand, capacity: capacity, price: price, name: name, expireDate: expireDate, caffeineContent: caffeineContent)
    }
}
