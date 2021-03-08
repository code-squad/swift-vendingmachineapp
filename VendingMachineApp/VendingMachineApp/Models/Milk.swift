//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/26.
//

import Foundation

class Milk: Beverage {
    private let milkFarmCode: String
    
    init(brand: String, capacity: Int, price: Int, name: String, expireDate: String, caffeineContent: Int, milkFarmCode: String) {
        self.milkFarmCode = milkFarmCode
        super.init(brand: brand, capacity: capacity, price: price, name: name, expireDate: expireDate, caffeineContent: caffeineContent)
    }
}
