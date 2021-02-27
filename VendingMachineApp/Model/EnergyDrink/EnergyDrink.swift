//
//  EnergyDrink.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class EnergyDrink : Beverage {
    enum Kind {
        case Monster
        case Hotsix
    }
    private var kind : Kind
    
    init(brand : String, capacity : Int, price : Int, name : String, create : String, expire: String, kind : EnergyDrink.Kind){
        self.kind = kind
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   create: create,
                   expire: expire)
    }
}
