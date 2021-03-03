//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Sprite: Soda {
    enum Flavor: String {
        case Original = "Original Sprite"
        case Ginger = "Ginger Sprite"
        case Tropical = "Tropical Sprite"
    }
    
    private var flavor: Flavor
    
    init(date: Date, isZero: Bool, flavor: Flavor, expiration: Date, hot: Bool, calorie: Int) {
        self.flavor = flavor
        super.init(brand: "스프라이트", capacity: 333, price: 1800, name: flavor.rawValue, date: date,expiration: expiration, hot: hot, calorie: calorie)
    }
}
