//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class Milk: Beverage {
    
    enum MilkType {
        case strawberry
        case chocolate
        case banana
    }
    
    private let type: MilkType
    
    init(brand: String, volume: Int, price: Int, name: String, manufactureDate: Date, type: MilkType) {
        self.type = type
        super.init(brand: brand, volume: volume, price: price, name: name, manufactureDate: manufactureDate)
    }
}
