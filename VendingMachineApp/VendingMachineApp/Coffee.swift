//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Coffee : Beverage {
    private var caffeineContent : Int
    private var caffeine : Bool
    
    init(caffeineContent : Int, caffeine : Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int) {
        self.caffeineContent = caffeineContent
        self.caffeine = caffeine
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature:temperature, kcal: kcal)
    }
    
    convenience init(caffeineContent : Int, caffeine : Bool, brand: String, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int){ //short size coffee
        self.init(caffeineContent : caffeineContent, caffeine : caffeine, brand: brand, volume: 236, price: price, name: name, manufactured: manufactured, temperature:temperature, kcal: kcal)
    }
}
