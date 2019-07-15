//
//  Milk.swift
//  VendingMachine
//
//  Created by jang gukjin on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Product {
    private var milkFarmCode: Int

    init(capacity: Int, price: Int, name: String, stringDate: String, milkFarmCode: Int) {
        self.milkFarmCode = milkFarmCode
        super.init(brand: "서울우유", capacity: capacity, price: price, name: name, stringDate: stringDate)
    }
}
