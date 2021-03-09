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
    
    init(brand: String, volume: Int, price: Int, name: String, calorie: Int, imageName: String, manufactured: Date?, expiredAfter: Date?, lactoseAmount: Int, flavor: MilkFlavor) {
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, name: name, calorie: calorie, imageName: imageName, manufactured: manufactured, expiredAfter: expiredAfter, lactoseAmount: lactoseAmount)
    }
}
