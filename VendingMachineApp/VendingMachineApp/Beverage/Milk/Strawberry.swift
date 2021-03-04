//
//  Strawberry.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/01.
//

import Foundation

class Strawberry: Milk {
    
    private let strawberryContent: Int //함량
    
    init(strawberryContent: Int) {
        self.strawberryContent = strawberryContent
        super.init(brand: "서울우유", volume: 240, price: 1000, name: "딸기 우유", manufacturedAt: Date().addingTimeInterval(800000), temparature: 3, calories: 80, isLowfat: false)
    }
}

