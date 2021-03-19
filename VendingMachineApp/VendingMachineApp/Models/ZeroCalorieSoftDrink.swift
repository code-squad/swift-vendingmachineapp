//
//  ZeroCalorieSoftDrink.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class ZeroCalorieSoftDrink: SoftDrink {
    
    init(volume: Int, manufactured: Date?, expiredAfter: Date?, isCarbonated: Bool) {
        super.init(volume: volume, calorie: 0, manufactured: manufactured, expiredAfter: expiredAfter, isCarbonated: isCarbonated)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
    }
}
