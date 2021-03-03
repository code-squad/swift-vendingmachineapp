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
    private var taste : Taste
    enum Taste {
        case americano, latte
    }
    
    init(caffeineContent : Int, caffeine : Bool, taste : Taste, brand: String, volume: Int, price: Int, name: String, manufactured: Date) {
        self.caffeineContent = caffeineContent
        self.caffeine = caffeine
        self.taste = taste
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured)
    }
    
    convenience init(caffeineContent : Int, caffeine : Bool, taste : Taste, brand: String, price: Int, name: String, manufactured: Date){ //short size coffee
        self.init(caffeineContent : caffeineContent, caffeine : caffeine, taste: taste, brand: brand, volume: 236, price: price, name: name, manufactured: manufactured)
    }
}
