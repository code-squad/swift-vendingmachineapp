//
//  EnergyDrink.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class EnergyDrink: Beverage, CaffeineContainable, CarbonationHavable {
    
    private let caffeineAmount: Int
    private let isCarbonated: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, calorie: Int, manufactured: String, expiredAfter: String, caffeineAmount: Int, isCarbonated: Bool) {
        self.caffeineAmount = caffeineAmount
        self.isCarbonated = isCarbonated
        super.init(brand: brand, volume: volume, price: price, name: name, calorie: calorie, manufactured: manufactured, expiredAfter: expiredAfter)
    }
    
    func hasCaffeine() -> Bool {
        return caffeineAmount > 0
    }
    
    func hasCarbonation() -> Bool {
        return isCarbonated
    }
}
