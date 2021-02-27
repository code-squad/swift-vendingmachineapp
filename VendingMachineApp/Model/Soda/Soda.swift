//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class Soda : Beverage {
    enum Kind {
        case Coke
        case Sprite
    }
    
    private var kind : Kind
    
    init(brand : String, capacity : Int, price : Int, name : String, create : String, expire: String, kind : Soda.Kind){
        self.kind = kind
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   create: create,
                   expire: expire)
    }
}
