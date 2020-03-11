//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private let bananaContent: Double
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, fatRatio: Double, bananaContent: Double) {
        self.bananaContent = bananaContent
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod, fatRatio: fatRatio)
    }
    
    // MARK: - NSCoding
    
    required init?(coder: NSCoder) {
        self.bananaContent = coder.decodeDouble(forKey: "bananaContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(bananaContent, forKey: "bananaContent")
    }
}
