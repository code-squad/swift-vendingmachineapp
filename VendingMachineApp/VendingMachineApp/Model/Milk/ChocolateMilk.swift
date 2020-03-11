//
//  ChocolateMilk.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    private let chocolateContent: Double
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, fatRatio: Double, chocolateContent: Double) {
        self.chocolateContent = chocolateContent
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod, fatRatio: fatRatio)
    }
    
    // MARK: - NSCoding
    
    required init?(coder: NSCoder) {
        self.chocolateContent = coder.decodeDouble(forKey: "chocolateContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(chocolateContent, forKey: "chocolateContent")
    }
}
