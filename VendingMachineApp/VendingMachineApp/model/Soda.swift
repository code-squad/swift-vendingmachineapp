//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 임승혁 on 2020/03/12.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Soda: Drink {
    private let carbonateContent: Int
    
    init(carbonateContent: Int,
         brand: String,
         capacity: Int,
         price: Int,
         name: String,
         manufacturingDate: Date = Date()) {
        self.carbonateContent = carbonateContent
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   manufacturingDate: manufacturingDate,
                   expiryDate: manufacturingDate.addingTimeInterval(3600 * 24 * 15))
    }
}
