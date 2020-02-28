//
//  SoftDrink.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class SoftDrink: Beverage {
    enum Product: String {
        case coke = "코카콜라"
        case sprite = "스프라이트"
        case fanta = "환타"
    }
    
    let product: Product
    
    override var description: String {
        return super.description
            + ", \(product.rawValue), \(DateFormatter.productionDateFormatter.string(from: productionDate))"
    }
    
    init(product: Product) {
        self.product = product
        switch product {
        case .coke: super.init(manufacturer: "코카콜라", size: 355, price: 1600)
        case .sprite: super.init(manufacturer: "코카콜라", size: 250, price: 1200)
        case .fanta: super.init(manufacturer: "코카콜라", size: 185, price: 900)
        }
        
    }
}
