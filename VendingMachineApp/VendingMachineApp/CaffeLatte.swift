//
//  CaffeLatte.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class CaffeeLatte : Coffee{
    let sugar : Bool
    
    init(sugar : Bool, caffeineContent: Int, caffeine: Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.sugar = sugar
        super.init(caffeineContent: caffeineContent, caffeine: caffeine, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
}
