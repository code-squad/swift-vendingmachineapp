//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/26.
//

import Foundation

class Coffee: Beverage {
    private let temperature: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, expireDate: String, caffeineContent: Int, temperature: Int) {
        self.temperature = temperature
        super.init(brand: brand, capacity: capacity, price: price, name: name, expireDate: expireDate, caffeineContent: caffeineContent)
    }
    
    func isHot() -> Bool {
        return temperature > 30
    }
}
