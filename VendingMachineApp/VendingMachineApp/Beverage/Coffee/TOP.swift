//
//  TOP.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class TOP: Coffee, BeverageInitable {
    
    private let taste: Taste
    
    enum Taste: String {
        case sweatAmericano = "sweatAmericano"
        case masterLatte = "masterLatte"
        case theBlack = "theBlack"
    }
    
    init(taste: Taste) {
        self.taste = taste
        super.init(brand: "Maxim", volume: 275, price: 2000, name: "T.O.P 에스프레소", manufacturedAt: Date().addingTimeInterval(800000), temparature: 3, calories: 10, isLowfat: true, caffeinContent: 100)
    }
    
    required convenience init() {
        self.init(taste: .sweatAmericano)
    }
    
    required init?(coder: NSCoder) {
        self.taste = Taste(rawValue: coder.decodeObject(forKey: "topTaste") as? String ?? "") ?? .sweatAmericano
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(taste.rawValue, forKey: "topTaste")
        super.encode(with: coder)
    }
}
