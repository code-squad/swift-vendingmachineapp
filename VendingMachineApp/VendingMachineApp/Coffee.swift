//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class Coffee: Beverage, HotServable {
    
    private let servingTemperature: Int
    
    init(brand: String, volume: Int, price: Int, name: String, calorie: Int, manufactured: String, expiredAfter: String, servingTemperature: Int) {
        self.servingTemperature = servingTemperature
        super.init(brand: brand, volume: volume, price: price, name: name, calorie: calorie, manufactured: manufactured, expiredAfter: expiredAfter)
    }
    
    func isHot() -> Bool {
        return servingTemperature >= 50
    }
}
