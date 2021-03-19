//
//  SoftDrink.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class SoftDrink: Beverage, CarbonationHavable {
    private let isCarbonated: Bool
    
    init(volume: Int, calorie: Int, manufactured: Date?, expiredAfter: Date?, isCarbonated: Bool) {
        self.isCarbonated = isCarbonated
        super.init(volume: volume, calorie: calorie, manufactured: manufactured, expiredAfter: expiredAfter)
    }
    
    struct PropertyKey {
        static let isCarbonatedKey = "isCarbonated"
    }
    
    required init?(coder: NSCoder) {
        self.isCarbonated = coder.decodeBool(forKey: PropertyKey.isCarbonatedKey)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(isCarbonated, forKey: PropertyKey.isCarbonatedKey)
        super.encode(with: coder)
    }
    
    func hasCarbonation() -> Bool {
        return isCarbonated
    }
}
