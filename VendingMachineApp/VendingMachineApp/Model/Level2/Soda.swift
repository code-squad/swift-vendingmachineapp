//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class Soda: Beverage, CustomStringConvertible {
    enum Taste {
        case lemon
        case apple
    }
    
    private var taste: Taste
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, taste: Taste) {
        self.taste = taste
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture)
    }
}
