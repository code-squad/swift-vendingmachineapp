//
//  Monster.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation
import UIKit

class Monster : EnergyDrink {
    enum Kind {
        case original
        case paradise
        case ultra
        case citra
    }
    
    let kind : Kind
    
    init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int, kind : Monster.Kind){
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
        self.init(brand: "몬스터음료주식회사",
                   capacity: 473,
                   price: 1500,
                   name: "몬스터",
                   createdAt: Date(),
                   expiredAt: Date().get7daysLatter(),
                   caffeine: 140,
                   kind : .original)
    }
}
