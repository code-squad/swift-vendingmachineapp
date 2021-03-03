//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/24.
//

import Foundation

class Cantata: Coffee {
    enum Flavor {
        case sweetAmericano, latte, mocha
    }
    
    private let flavor: Flavor
    
    init(manufacturer: String, volume: Int, name: String, manufacturedAt: Date, price: Int, caffeineContent: Int, temperature: Int, calorie: Int, flavor: Flavor, expiredAt: Date) {
        self.flavor = flavor
        super.init(manufacturer: manufacturer, volume: volume, name: name, manufacturedAt: manufacturedAt, price: price, caffeineContent: caffeineContent, temperature: temperature, calorie: calorie, expiredAt: expiredAt)
    }
    
    convenience init() {
        self.init(manufacturer: "롯데칠성음료", volume: 200, name: "칸타타프리미엄라떼", manufacturedAt: Date(), price: 2000, caffeineContent: 10, temperature: 100, calorie: 100, flavor: .latte, expiredAt: Date())
    }
}
