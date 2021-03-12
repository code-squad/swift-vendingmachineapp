//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class Georgia : Coffee {
    
    enum Kind : String {
        case original = "original"
        case caffelatte = "caffelatte"
    }
    let kind : Kind

    init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int, temperature: Int, kind: Georgia.Kind) {
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
        self.init(brand: "조지아",
                   capacity: 275,
                   price: 1000,
                   name: "조지아오리지널",
                   createdAt: Date(),
                   expiredAt: Date().get7daysLatter(),
                   caffeine: 100,
                   temperature: 65,
                   kind: Kind.original)
    }
    required init?(coder: NSCoder) {
        self.kind = Kind(rawValue: coder.decodeObject(forKey: "Georgiakind") as! String)!
        super.init(coder: coder)
    }
    override func encode(with coder: NSCoder) {
        coder.encode(kind.rawValue, forKey: "Georgiakind")
        super.encode(with: coder)
    }
}

