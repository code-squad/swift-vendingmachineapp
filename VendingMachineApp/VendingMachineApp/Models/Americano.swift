//
//  Americano.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/03/04.
//

import Foundation

final class Americano: Coffee {
    private let isDoubleShot: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, expireDate: String, caffeineContent: Int, temperature: Int, isDoubleShot: Bool) {
        self.isDoubleShot = isDoubleShot
        super.init(brand: brand, capacity: capacity, price: price, name: name, expireDate: expireDate, caffeineContent: caffeineContent, temperature: temperature)
    }
    
    convenience init(expireDate: String) {
        self.init(
            brand: "맥심",
            capacity: 275,
            price: 2200,
            name: "TOP아메리카노",
            expireDate: expireDate,
            caffeineContent: 98,
            temperature: 5,
            isDoubleShot: false
        )
    }
}
