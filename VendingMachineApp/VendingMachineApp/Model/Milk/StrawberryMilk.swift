//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private let strawberryContent: Double
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, fatRatio: Double, strawberryContent: Double) {
        self.strawberryContent = strawberryContent
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod, fatRatio: fatRatio)
    }
    
    // MARK: - NSCoding
    
    required init?(coder: NSCoder) {
        self.strawberryContent = coder.decodeDouble(forKey: "strawberryContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(strawberryContent, forKey: "strawberryContent")
    }
}
