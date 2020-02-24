//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Beverage {
    var brand: String
    var capacity: Int
    var price: Int
    var name: String
    var manufacturingDate: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturingDate: Date){
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
    }
}
