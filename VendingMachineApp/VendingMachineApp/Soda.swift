//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Soda : Beverage {
    private var sugar : Bool
    private var flavor : Flavor
    
    enum Flavor {
        case lemon, lime
    }
    
    init(sugar : Bool, flavor : Flavor, brand : String, volume : Int, price : Int, name : String, manufactured : Date, temperature : Int, kcal : Int) {
        self.sugar = sugar
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured,temperature: temperature, kcal: kcal)
    }
    
    convenience init(flavor : Flavor, brand : String, volume : Int, price : Int, name : String, manufactured : Date, temperature : Int, kcal : Int){ //No Sugar
        self.init(sugar: false, flavor: flavor, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature : temperature, kcal : kcal)
    }
    
}
