//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Coffee: Drink {
    private let caffeineContent: Int
    
    init(manufacturer: String, volume: Int, name: String, manufacturedAt: Date, price: Int, caffeineContent: Int, temperature: Int, calorie: Int, expiredAt: Date) {
        self.caffeineContent = caffeineContent
        super.init(manufacturer: manufacturer, volume: volume, name: name, manufacturedAt: manufacturedAt, price: price, temperature: temperature, calorie: calorie, expiredAt: expiredAt)
    }
    
    required init?(coder: NSCoder) {
        self.caffeineContent = coder.decodeInteger(forKey: "caffeineContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(caffeineContent, forKey: "caffeineContent")
        super.encode(with: coder)
    }
}
