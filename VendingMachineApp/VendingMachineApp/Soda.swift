//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Soda : Beverage {
    private var sugar : Bool
    
    init(sugar : Bool, brand : String, volume : Int, price : Int, name : String, manufactured : Date, temperature : Int, kcal : Int) {
        self.sugar = sugar
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured,temperature: temperature, kcal: kcal)
    }
    
    convenience init(brand : String, volume : Int, price : Int, name : String, manufactured : Date, temperature : Int){ //No Sugar
        self.init(sugar: false, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature : temperature, kcal : 50)
    }
    
}
