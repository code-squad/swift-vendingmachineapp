//
//  SoftDrink.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class SoftDrink: Beverage, CarbonationHavable {
    
    private let isCarbonated: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, calorie: Int, imageName: String, manufactured: Date?, expiredAfter: Date?, isCarbonated: Bool) {
        self.isCarbonated = isCarbonated
        super.init(brand: brand, volume: volume, price: price, name: name, calorie: calorie, imageName: imageName, manufactured: manufactured, expiredAfter: expiredAfter)
    }
    
    func hasCarbonation() -> Bool {
        return isCarbonated
    }
}
