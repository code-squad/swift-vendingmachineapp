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
    
    func isDecaffeinated() -> Bool {
        return caffeineContent < 10
    }
    
    init(brand: String, amount: Int, price: Int, name: String, caffeineContent: Double) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, amount: amount, price: price, name: name)
    }
}
