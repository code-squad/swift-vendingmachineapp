//
//  Soda.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private let sugarContent: Double
    
    init(brand: String, amount: Int, price: Int, name: String, calorie: Double, saleablePeriod: Int, sugarContent: Double) {
        self.sugarContent = sugarContent
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod)
    }
    
    func isUnsweetened() -> Bool {
        return sugarContent == 0
    }
}
