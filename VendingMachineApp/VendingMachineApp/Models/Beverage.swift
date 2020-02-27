//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Beverage {
    let manufacturer: String
    let size: Int
    let price: Int
    let productionDate: Date
    
    fileprivate init(manufacturer: String, size: Int, price: Int) {
        self.manufacturer = manufacturer
        self.size = size
        self.price = price
        self.productionDate = Date()
    }
}

final class Milk: Beverage {
    enum Product {
        case strawberryMilk, chocolateMilk, bananaMilk
    }
    
    let product: Product
    
    init(product: Product) {
        self.product = product
        super.init(manufacturer: "매일유업", size: 300, price: 1500)
    }
}

final class SoftDrink: Beverage {
    enum Product {
        case coke, sprite, fanta
    }
    
    let product: Product
    
    init(product: Product) {
        self.product = product
        switch product {
        case .coke: super.init(manufacturer: "코카콜라", size: 355, price: 1600)
        case .sprite: super.init(manufacturer: "코카콜라", size: 250, price: 1200)
        case .fanta: super.init(manufacturer: "코카콜라", size: 185, price: 900)
        }
        
    }
}

final class Coffee: Beverage {
    enum Product {
        case top, cantata, georgia
    }
    
    let product: Product
    
    init(product: Product) {
        self.product = product
        switch product {
        case .top: super.init(manufacturer: "동서식품", size: 260, price: 1200)
        case .cantata: super.init(manufacturer: "롯데", size: 225, price: 1250)
        case .georgia: super.init(manufacturer: "코카콜라", size: 250, price: 1300)
        }
    }
}
