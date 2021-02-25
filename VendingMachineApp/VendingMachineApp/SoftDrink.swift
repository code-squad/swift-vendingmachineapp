//
//  SoftDrink.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class SoftDrink: Beverage {
    
    enum SoftDrinkType {
        case cola
        case sprite
        case fanta
    }
    
    private let type: SoftDrinkType
    
    init(brand: String, volume: Int, price: Int, name: String, manufactured: String, type: SoftDrinkType) {
        self.type = type
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured)
    }
}
