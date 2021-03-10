//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class Cantata : Coffee {
    
    enum Kind {
        case sweetAmericano
        case premiumLette
        case caramelMacchiato
    }
    
    let kind : Kind

    init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int, temperature: Int, kind: Cantata.Kind) {
        self.kind = kind
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   caffeine: caffeine,
                   temperature: temperature)
    }
    convenience required init(){
        self.init(brand: "롯데칠성음료",
                   capacity: 275,
                   price: 1000,
                   name: "칸타타",
                   createdAt: Date(),
                   expiredAt: Date().get7daysLatter(),
                   caffeine: 100,
                   temperature : 65,
                   kind: Kind.sweetAmericano)
    }
}
