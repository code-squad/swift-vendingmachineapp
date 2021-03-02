//
//  TOP.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Top: Coffee {
    enum Flavor: String {
        case Black = "The Black"
        case SweetAmericano = "Sweet Americano"
        case Latte = "Maset Latte"
    }
    
    private var flavor: Flavor
    
    init(date: Date, decaffein: Bool, flavor: Flavor, expiration: Date, hot: Bool, calorie: Int) {
        self.flavor = flavor
        super.init(brand: "TOP", capacity: 275, price: 1800, name: flavor.rawValue, date: date, decaffein: decaffein, expiration: expiration, hot: hot, calorie: calorie)
    }
}
