//
//  TOP.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class TOP: Coffee {
    override init(brand: String, volume: Int, price: Money, productName: String,
                  expiryDate: Date, calorie: Int, isHot: Bool) {
        super.init(brand: brand, volume: volume, price: price, productName: productName,
                   expiryDate: expiryDate, calorie: calorie, isHot: isHot)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    override var description: String {
        return "TOP"
    }
}
