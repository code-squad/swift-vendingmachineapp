//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    override init(brand: String, volume: Int, price: Money, productName: String, expiryDate: Date, calorie: Int) {
        super.init(brand: brand, volume: volume, price: price, productName: productName,
                   expiryDate: expiryDate, calorie: calorie)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    override var description: String {
        return "바나나우유"
    }
}
