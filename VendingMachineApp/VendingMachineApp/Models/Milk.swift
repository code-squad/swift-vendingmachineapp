//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class Milk: Beverage {
    enum Flavor: String {
        case strawberry = "상하목장 유기농 딸기우유"
        case chocolate = "바나나는 원래 하얗다"
        case banana = "매일 멸균우유 초코"
    }
    
    let flavor: Flavor
    
    override var description: String {
        return super.description
            + ", \(flavor.rawValue), \(productionDate.stockDisplayingFormat)"
    }
    
    init(flavor: Flavor) {
        self.flavor = flavor
        super.init(manufacturer: "매일유업", size: 300, price: 1500)
    }
}
