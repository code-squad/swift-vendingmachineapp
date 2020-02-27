//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    let manufacturer: String
    let size: Int
    let price: Int
    let productionDate: Date
    
    var description: String {
        return "\(manufacturer), \(size), \(price)"
    }
    
    fileprivate init(manufacturer: String, size: Int, price: Int) {
        self.manufacturer = manufacturer
        self.size = size
        self.price = price
        self.productionDate = Date()
    }
}

final class Milk: Beverage {
    enum Flavor: String {
        case strawberry = "상하목장 유기농 딸기우유"
        case chocolate = "바나나는 원래 하얗다"
        case banana = "매일 멸균우유 초코"
    }
    
    let flavor: Flavor
    
    override var description: String {
        return super.description + ", \(flavor.rawValue)"
    }
    
    init(flavor: Flavor) {
        self.flavor = flavor
        super.init(manufacturer: "매일유업", size: 300, price: 1500)
    }
}

final class SoftDrink: Beverage {
    enum Product: String {
        case coke = "코카콜라"
        case sprite = "스프라이트"
        case fanta = "환타"
    }
    
    let product: Product
    
    override var description: String {
        return super.description + ", \(product.rawValue)"
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

final class Coffee: Beverage {
    enum Product: String {
        case top = "티.오.피"
        case cantata = "칸타타 프리미엄라떼"
        case georgia = "조지아 오리지널"
    }
    
    let product: Product
    
    override var description: String {
        return super.description + ", \(product.rawValue)"
    }
    
    init(product: Product) {
        self.product = product
        switch product {
        case .top: super.init(manufacturer: "동서식품", size: 260, price: 1200)
        case .cantata: super.init(manufacturer: "롯데", size: 225, price: 1250)
        case .georgia: super.init(manufacturer: "코카콜라", size: 250, price: 1300)
        }
    }
}
