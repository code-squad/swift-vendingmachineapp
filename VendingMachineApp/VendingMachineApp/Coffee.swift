//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Coffee : Beverage {
    private var caffeineContent : Int
    private var caffeine : Bool = false
    
    init(caffeineContent : Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature:temperature, kcal: kcal)
        self.caffeine = isCaffeine() //기본적으로 카페인 없지만 카페인 량에 따라 여기서 재정의
    }
    
    convenience init(caffeineContent : Int, caffeine : Bool, brand: String, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int){ //short size coffee
        self.init(caffeineContent : caffeineContent, brand: brand, volume: 236, price: price, name: name, manufactured: manufactured, temperature:temperature, kcal: kcal)
    }
    
    private func isCaffeine() -> Bool{
        return self.caffeineContent > 0
    }
}
