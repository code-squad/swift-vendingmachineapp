//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Beverage {
    
    let brand: String
    let volume: Int
    let price: Int
    let name: String
    let manufacturingDate: Date
    
    init(brand: String, volume: Int, price: Int,
         name: String, manufacturingDate: Date){
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
    }
}
