//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class Coffee: Beverage {
    
    override init(brand: String, volume: Int, price: Int, name: String, calorie: Int, manufactured: String, expiredAfter: String) {
        super.init(brand: brand, volume: volume, price: price, name: name, calorie: calorie, manufactured: manufactured, expiredAfter: expiredAfter)
    }
}
