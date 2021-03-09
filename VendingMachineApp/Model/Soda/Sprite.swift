//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation
import UIKit

class Sprite : Soda {
    
    let lowSuger : Bool

    init(brand: String, capacity: Int, price: Int, name: String, createdAt: String, expiredAt: String, lowSuger : Bool) {
        self.lowSuger = lowSuger
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt)
    }
    convenience init(createdAt : String, expiredAt : String) {
        self.init(brand: "칠성사이다",
                   capacity: 350,
                   price: 3500,
                   name: "코카콜라",
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   lowSuger : false)
    }
}
