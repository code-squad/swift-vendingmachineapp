//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class Coffee: Beverage {
    enum Product: String {
        case top = "티.오.피"
        case cantata = "칸타타 프리미엄라떼"
        case georgia = "조지아 오리지널"
    }
    
    let product: Product
    
    override var description: String {
        return super.description
            + ", \(product.rawValue), \(DateFormatter.productionDateFormatter.string(from: productionDate))"
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
