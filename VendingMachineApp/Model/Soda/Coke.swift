//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class Coke : Soda {
    enum Flaver {
        case cherry
        case vanilla
    }
    let faver : Flaver
    
    
    init(brand: String, capacity: Int, price: Int, name: String, createdAt: String, expiredAt: String, flaver : Coke.Flaver) {
        self.faver = flaver
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt)
    }
    
    convenience init(createdAt : String, expiredAt : String) {
        self.init(brand: "팹시",
                   capacity: 350,
                   price: 3500,
                   name: "코카콜라",
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   flaver : .cherry)
    }
}
