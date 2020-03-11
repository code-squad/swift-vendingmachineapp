//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let caffeineContent: Double
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, caffeineContent: Double, isHot: Bool) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod, isHot: isHot)
    }
    
    func isDecaffeinated() -> Bool {
        return caffeineContent < 10
    }
    
    // MARK: - NSCoding
    
    required init?(coder: NSCoder) {
        self.caffeineContent = coder.decodeDouble(forKey: "caffeineContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(caffeineContent, forKey: "caffeieneContent")
    }
}
