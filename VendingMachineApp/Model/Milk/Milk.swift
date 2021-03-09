//
//  Mink.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation
import UIKit

class Milk : Beverage {
    private var lowFat : Bool
    
    init(brand : String, capacity : Int, price : Int, name : String, createdAt : String, expiredAt : String, lowFat : Bool){
        self.lowFat = lowFat
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt)
    }
}
