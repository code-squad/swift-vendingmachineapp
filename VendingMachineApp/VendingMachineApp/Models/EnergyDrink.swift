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
    
    init(volume: Int, calorie: Int, manufactured: Date?, expiredAfter: Date?, caffeineAmount: Int, isCarbonated: Bool) {
        self.caffeineAmount = caffeineAmount
        self.isCarbonated = isCarbonated
        super.init(volume: volume, calorie: calorie, manufactured: manufactured, expiredAfter: expiredAfter)
    }
    
    struct PropertyKey {
        static let caffeineAmountKey = "caffeineAmount"
        static let isCarbonatedKey = "isCarbonated"
    }
    
    required init?(coder: NSCoder) {
        self.caffeineAmount = coder.decodeInteger(forKey: PropertyKey.caffeineAmountKey)
        self.isCarbonated = coder.decodeBool(forKey: PropertyKey.isCarbonatedKey)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(caffeineAmount, forKey: PropertyKey.caffeineAmountKey)
        coder.encode(isCarbonated, forKey: PropertyKey.isCarbonatedKey)
        super.encode(with: coder)
    }
    
    func hasCaffeine() -> Bool {
        return caffeineAmount > 0
    }
    
    func hasCarbonation() -> Bool {
        return isCarbonated
    }
}
