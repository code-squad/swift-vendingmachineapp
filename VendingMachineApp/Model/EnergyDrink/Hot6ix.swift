//
//  Hotsix.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation
import UIKit

class Hot6ix : EnergyDrink {
 
    enum Kind {
        case original
        case punch
        case power
    }
    let kind : Kind
    
    init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int, kind : Hot6ix.Kind){
        self.kind = kind
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   caffeine: caffeine)
    }
    
    convenience required init() {
        self.init(brand: "롯데칠성음료",
                   capacity: 473,
                   price: 1000,
                   name: "핫식스",
                   createdAt: Date(),
                   expiredAt: Date().get7daysLatter(),
                   caffeine: 140,
                   kind : .power)
    }
}
