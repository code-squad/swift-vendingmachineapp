//
//  Fanta.swift
//  VendingMachineApp
//
//  Created by 임승혁 on 2020/03/12.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Fanta: Drink {
    var taste: String
    
    init(taste: String, brand: String, capacity: Int, price: Int, name: String, manufacturingDate: Date, expiryDate:Date) {
        self.taste = taste
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, expiryDate: expiryDate)
    }
}
