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
    
    enum taste {
        case americano, latte
    }
    
    init(caffeineContent : Int, caffeine : Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date) {
        self.caffeineContent = caffeineContent
        self.caffeine = caffeine
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured)
    }
    
    convenience init(caffeineContent : Int, caffeine : Bool, brand: String, price: Int, name: String, manufactured: Date){ //short size coffee
        self.init(caffeineContent : caffeineContent, caffeine : caffeine, brand: brand, volume: 236, price: price, name: name, manufactured: manufactured)
    }
}
