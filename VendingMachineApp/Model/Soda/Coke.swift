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
    let faver : Coke.Flaver
    
    init(create: String, expire: String, flaver : Coke.Flaver){
        self.faver = flaver
        super.init(brand: "팹시",
                   capacity: 350,
                   price: 3500,
                   name: "코카콜라",
                   create: create,
                   expire: expire)
    }
}
