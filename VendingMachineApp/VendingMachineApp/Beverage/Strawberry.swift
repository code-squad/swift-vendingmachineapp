//
//  Strawberry.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/01.
//

import Foundation

class Strawberry: Milk {
    init() {
        super.init(brand: "서울우유", volume: 240, price: 1000, name: "딸기 우유", manufacturedAt: Date(), isLowfat: false)
    }
}

