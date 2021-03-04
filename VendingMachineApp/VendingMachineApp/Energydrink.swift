//
//  Energydrink.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Energydrink : Beverage {
    private var caffeine : Bool
    
    init(caffeine : Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int){
        self.caffeine = caffeine
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    convenience init(brand: String, volume: Int, price: Int, name: String, manufactured: Date, kcal : Int){ //카페인 있는 에너지 드링크
        self.init(caffeine: true, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: 5, kcal: kcal)
    }
}
