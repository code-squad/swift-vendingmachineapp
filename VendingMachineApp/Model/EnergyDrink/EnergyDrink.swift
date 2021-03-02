//
//  EnergyDrink.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class EnergyDrink : Beverage {
    
    private let caffeine : Int
    
    enum Kind : String{
        case monster = "Monster"
        case hot6ix = "Hot6ix"
    }
    
    init(brand: String, capacity: Int, price: Int, name: String, create: String, expire: String , caffeine : Int){
        self.caffeine = caffeine
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   create: create,
                   expire: expire)
    }
}
