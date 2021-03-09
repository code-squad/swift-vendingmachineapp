//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class Georgia : Coffee {
    
    enum Kind {
        case original
        case caffelatte
    }
    let kind : Kind

    init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int, hot: Bool, kind: Georgia.Kind) {
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
    
    convenience required init(){
        self.init(brand: "조지아",
                   capacity: 275,
                   price: 1000,
                   name: "조지아오리지널",
                   createdAt: Date(),
                   expiredAt: Date().get7daysLatter(),
                   caffeine: 100,
                   hot: false,
                   kind: Kind.original)
    }
}

