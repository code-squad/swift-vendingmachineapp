//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 임승혁 on 2020/03/12.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Coffee: Drink {
    private let caffeineContent: Int
    
    init(caffeineContent: Int,
         brand: String,
         capacity: Int,
         price: Int,
         name: String,
         manufacturingDate: String,
         expiryDate:String) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   manufacturingDate: manufacturingDate,
                   expiryDate: expiryDate)
    }
}
