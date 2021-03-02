//
//  Top.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class Top : Coffee {
    
    enum Kind {
        case caffelatte
        case americano
        case black
    }
    
    let kind : Kind

    init(brand: String, capacity: Int, price: Int, name: String, createdAt: String, expiredAt: String, caffeine: Int, hot: Bool, kind: Top.Kind) {
        self.kind = kind
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   caffeine: caffeine,
                   hot : hot)
    }
    
    convenience init(createdAt : String, expiredAt : String, hot: Bool = false, kind : Top.Kind = .black){
        self.init(brand: "맥심",
                   capacity: 275,
                   price: 1700,
                   name: "맥심TOP",
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   caffeine: 100,
                   hot: hot,
                   kind: kind)
    }
}
