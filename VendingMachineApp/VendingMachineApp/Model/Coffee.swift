//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    enum Category {
        case top
        case cantata
        case georgia
    }
    private let category: Category
    
    init(brand: String, amount: Int, price: Int, name: String, category: Category) {
        self.category = category
        super.init(brand: brand, amount: amount, price: price, name: name)
    }
}
