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
    
    init(sugar : Bool, kcal : Int, brand : String, volume : Int, price : Int, name : String, manufactured : Date) {
        self.sugar = sugar
        self.kcal = kcal
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured)
    }
    
    enum tatse {
        case lemon, lime
    }
}
