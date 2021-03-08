//
//  EnergyDrink.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/03/04.
//

import Foundation

final class EnergyDrink: SoftDrink {
    enum Flavor {
        case original
        case ultra
        case citra
        case pipelinePunch
    }
    private let flavor: Flavor
    
    init(brand: String, capacity: Int, price: Int, name: String, expireDate: String, caffeineContent: Int, bubbleIntensity: BubbleIntensity, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, expireDate: expireDate, caffeineContent: caffeineContent, bubbleIntensity: bubbleIntensity)
    }
    
    convenience init(expireDate: String) {
        self.init(
            brand: "몬스터에너지",
            capacity: 355,
            price: 2200,
            name: "코카콜라제로",
            expireDate: expireDate,
            caffeineContent: 128,
            bubbleIntensity: .high,
            flavor: .original
        )
    }
}
