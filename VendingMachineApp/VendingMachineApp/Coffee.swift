//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class Coffee: Beverage {
    
    enum CoffeeType {
        case top
        case cantata
        case georgia
    }
    
    private let type: CoffeeType
    
    init(brand: String, volume: Int, price: Int, name: String, manufactured: String, type: CoffeeType) throws {
        self.type = type
        try super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured)
    }
}
