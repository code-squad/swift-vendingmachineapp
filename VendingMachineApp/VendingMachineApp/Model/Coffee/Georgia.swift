//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Georgia: Coffee {

    enum CoffeeType {
        case original
        case cafeLatte
        case americano
        case theBlend
    }
    
    private let type: CoffeeType
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int, type: CoffeeType) {
        self.type = type
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, caffeine: caffeine)
    }
    
    required init() {
        type = .original
        super.init(brand: "코카콜라", volume: 240, price: 1000, name: "조지아", createdAt: date, expiredAt: date, caffeine: 136)
    }
    
    func isNewType() -> Bool {
        return type != .original
    }
}
