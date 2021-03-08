//
//  ZeroCalorieSoftDrink.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class ZeroCalorieSoftDrink: SoftDrink {
    
    init(brand: String, volume: Int, price: Int, name: String, manufactured: Date?, expiredAfter: Date?, isCarbonated: Bool) {
        super.init(brand: brand, volume: volume, price: price, name: name, calorie: 0, manufactured: manufactured, expiredAfter: expiredAfter, isCarbonated: isCarbonated)
    }
}
