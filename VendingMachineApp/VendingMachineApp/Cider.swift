//
//  Cider.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class Cider : Soda{
    let flavor : Flavor
    
    enum Flavor {
        case lime, lemon
    }
    
    init(flavor:Flavor, sugar: Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.flavor = flavor
        super.init(sugar: sugar, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
}
