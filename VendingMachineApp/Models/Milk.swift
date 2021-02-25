//
//  Mink.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class Milk : Beverage {
    enum Kind {
        case Stroberry
        case Chocolate
        case Banana
    }
    
    private var kind : Kind
    
    init(brand : String, capacity : Int, price : Int, name : String, createDate : Date, kind : Milk.Kind){
        self.kind = kind
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createDate: createDate)
    }
    
}
