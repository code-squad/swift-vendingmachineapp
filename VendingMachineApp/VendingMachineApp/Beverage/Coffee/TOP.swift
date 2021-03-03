//
//  TOP.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class TOP: Coffee {
    
    private let taste: Taste
    
    enum Taste {
        case sweatAmericano
        case masterLatte
        case theBlack
    }
    
    init(taste: Taste) {
        self.taste = taste
        super.init(brand: "Maxim", volume: 275, price: 2000, name: "T.O.P 에스프레소", manufacturedAt: Date(), temparature: 3, calories: 10, isLowfat: true, caffeinContent: 100)
    }
}
