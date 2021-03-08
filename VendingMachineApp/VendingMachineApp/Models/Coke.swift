//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/03/04.
//

import Foundation

final class Coke: SoftDrink {
    private let isZeroCoke: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, expireDate: String, caffeineContent: Int, bubbleIntensity: BubbleIntensity, isZeroCoke: Bool) {
        self.isZeroCoke = isZeroCoke
        super.init(brand: brand, capacity: capacity, price: price, name: name, expireDate: expireDate, caffeineContent: caffeineContent, bubbleIntensity: bubbleIntensity)
    }
    
    convenience init(expireDate: String) {
        self.init(
            brand: "코카콜라",
            capacity: 250,
            price: 1500,
            name: "코카콜라제로",
            expireDate: expireDate,
            caffeineContent: 24,
            bubbleIntensity: .high,
            isZeroCoke: true
        )
    }
}
