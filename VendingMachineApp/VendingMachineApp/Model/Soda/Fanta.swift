//
//  Fanta.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Fanta: Soda {
    private let flavor: String
    
    init(brand: String, amount: Int, price: Int, name: String, calorie: Double, saleablePeriod: Int, sugarContent: Double, flavor: String) {
        self.flavor = flavor
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod, sugarContent: sugarContent)
    }
}
