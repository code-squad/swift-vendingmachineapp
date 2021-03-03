//
//  Energydrink.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Energydrink : Beverage {
    private var caffeine : Int
    private var kcal : Int
    
    init(caffeine : Int, kcal : Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date){
        self.caffeine = caffeine
        self.kcal = kcal
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured)
    }
    
    enum taste {
        case monster, diablo
    }
}
