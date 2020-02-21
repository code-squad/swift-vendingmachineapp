//
//  Milk.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Milk: Beverage {
    enum Flavor {
        case strawberry
        case chocolate
        case banana
    }
    private let flavor: Flavor
    
    init(brand: String, amount: Int, price: Int, name: String, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, amount: amount, price: price, name: name)
    }
}
