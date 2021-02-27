//
//  Monster.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class Monster : EnergyDrink {
    
    init(create : String, expire: String){
        super.init(brand: "몬스터음료주식회사", capacity: 473, price: 1500, name: "몬스터", create: create, expire: expire, caffeine: 140)
    }
}
