//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation
import UIKit

class Soda : Beverage {
    required init() {
        super.init()
    }
    override init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date) {
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt)
    }
}
