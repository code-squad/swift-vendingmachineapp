//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Soda : Beverage {
    private var sugar : Bool
    private var kcal : Int
    private var flavor : Flavor
    
    enum Flavor {
        case lemon, lime
    }
    
    init(sugar : Bool, kcal : Int, flavor : Flavor, brand : String, volume : Int, price : Int, name : String, manufactured : Date) {
        self.sugar = sugar
        self.kcal = kcal
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured)
    }
    
    convenience init(kcal : Int, flavor : Flavor, brand : String, volume : Int, price : Int, name : String, manufactured : Date){ //No Sugar
        self.init(sugar: false, kcal: kcal, flavor: flavor, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured)
    }
    
}
