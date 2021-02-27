//
//  Hotsix.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class Hot6ix : EnergyDrink {
 
    enum Flaver {
        case lemon
        case grapefruit
    }
    let flaver : Flaver
    
    init(create : String, expire: String, flaver : Hot6ix.Flaver){
        self.flaver = flaver
        super.init(brand: "롯데칠성음료", capacity: 250, price: 1500, name: "몬스터", create: create, expire: expire, caffeine: 100)
    }
}
