//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Milk : Beverage {
    private var lowfat : Bool
    
    init(lowfat : Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int) {
        self.lowfat = lowfat
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature : temperature, kcal : kcal)
    }
    
    convenience init(brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int){ //저지방 우유
        self.init(lowfat : true, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature : temperature, kcal: 50)
    }
}
