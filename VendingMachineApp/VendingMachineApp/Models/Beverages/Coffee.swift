//
//  Coffee.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let _isHot: Bool
    
    private enum CodingKeys: String, CodingKey {
        case isHot = "hottedCoffee"
    }
    
    init(brand: String, volume: Int, price: Money, productName: String, expiryDate: Date, calorie: Int, isHot: Bool) {
        self._isHot = isHot
        super.init(brand: brand, volume: volume, price: price, productName: productName,
                   expiryDate: expiryDate, calorie: calorie)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self._isHot = try values.decode(Bool.self, forKey: .isHot)
        try super.init(from: decoder)
    }
    
    var isHot: Bool {
        return self._isHot
    }
}
