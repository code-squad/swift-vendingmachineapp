//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/03/04.
//

import Foundation

final class BananaMilk: Milk {
    private let bananaContentRate: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, expireDate: String, caffeineContent: Int, milkFarmCode: String, bananaContentRate: Int) {
        self.bananaContentRate = bananaContentRate
        super.init(brand: brand, capacity: capacity, price: price, name: name, expireDate: expireDate, caffeineContent: caffeineContent, milkFarmCode: milkFarmCode)
    }
    
    convenience init(expireDate: String) {
        self.init(
            brand: "빙그레",
            capacity: 240,
            price: 1400,
            name: "바나나맛우유",
            expireDate: expireDate,
            caffeineContent: 0,
            milkFarmCode: "GW116",
            bananaContentRate: 0
        )
    }
}
