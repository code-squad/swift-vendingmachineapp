//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class Coffee : Beverage{
    enum Kind {
        case Cantata
        case Top
        case Georgia
    }
    
    var kind : Kind
    
    init(brand : String, capacity : Int, price : Int, name : String, createDate : Date, kind : Coffee.Kind){
        self.kind = kind
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createDate: createDate)
    }
}
