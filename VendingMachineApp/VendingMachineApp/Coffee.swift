//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class Coffee: Beverage, HotServable, CaffeineContainable {
    
    private let servingTemperature: Int
    private let caffeineAmount: Int
    
    init(brand: String, volume: Int, price: Int, name: String, calorie: Int, manufactured: String, expiredAfter: String, servingTemperature: Int, caffeineAmount: Int) {
        self.servingTemperature = servingTemperature
        self.caffeineAmount = caffeineAmount
        super.init(brand: brand, volume: volume, price: price, name: name, calorie: calorie, manufactured: manufactured, expiredAfter: expiredAfter)
    }
    
    func isHot() -> Bool {
        return servingTemperature >= 50
    }
    
    func hasCaffeine() -> Bool {
        return caffeineAmount > 0
    }
}
