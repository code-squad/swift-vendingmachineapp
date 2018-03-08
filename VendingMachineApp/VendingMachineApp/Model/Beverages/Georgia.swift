//
//  Georgia.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    override init(brand: String, volume: Int, price: Money, productName: String, expiryDate: Date,
                  calorie: Int, isHot: Bool) {
        super.init(brand: brand, volume: volume, price: price, productName: productName,
                   expiryDate: expiryDate, calorie: calorie, isHot: isHot)
    }
    
    override var description: String {
        return "조지아커피"
    }
}
