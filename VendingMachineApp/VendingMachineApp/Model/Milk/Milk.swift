//
//  Milk.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Milk: Beverage {
    static let lowFatStandard = 3.0
    private let fatRatio: Double
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, fatRatio: Double) {
        self.fatRatio = fatRatio
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod)
    }
    
    func isLowFat() -> Bool {
        return fatRatio < Milk.lowFatStandard
    }
    
    // MARK: - NSCoding
    
    required init?(coder: NSCoder) {
        self.fatRatio = coder.decodeDouble(forKey: "fatRatio")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(fatRatio, forKey: "fatRatio")
    }
}
