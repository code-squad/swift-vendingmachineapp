//
//  FlavoredMilk.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class FlavoredMilk: Milk {
    
    enum MilkFlavor {
        case strawberry
        case chocolate
        case banana
    }
    
    private let flavor: MilkFlavor
    
    init(brand: String, volume: Int, price: Int, name: String, calorie: Int, manufactured: String, expiredAfter: String, hasLactose: Bool, flavor: MilkFlavor) {
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, name: name, calorie: calorie, manufactured: manufactured, expiredAfter: expiredAfter)
    }
}
