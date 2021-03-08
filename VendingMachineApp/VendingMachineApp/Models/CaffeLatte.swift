//
//  Latte.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/03/04.
//

import Foundation

class CaffeLatte: Coffee {
    enum Flavor {
        case mocha
        case coffee
        case caramel
        case cookie
    }
    
    private let flavor: Flavor
    
    init(brand: String, capacity: Int, price: Int, name: String, expireDate: String, caffeineContent: Int, temperature: Int, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, expireDate: expireDate, caffeineContent: caffeineContent, temperature: temperature)
    }
    
    convenience init(expireDate: String) {
        self.init(
            brand: "스타벅스",
            capacity: 281,
            price: 2900,
            name: "스타벅스프라푸치노모카",
            expireDate: expireDate,
            caffeineContent: 82,
            temperature: 40,
            flavor: .mocha
        )
    }
}
