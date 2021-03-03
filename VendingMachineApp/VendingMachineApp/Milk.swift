//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class Milk: Beverage, LactoseFree {
    
    private let hasLactose: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, calorie: Int, manufactured: String, expiredAfter: String, hasLactose: Bool) {
        self.hasLactose = hasLactose
        super.init(brand: brand, volume: volume, price: price, name: name, calorie: calorie, manufactured: manufactured, expiredAfter: expiredAfter)
    }
    
    func isLactoseFree() -> Bool {
        return !hasLactose
    }
}
