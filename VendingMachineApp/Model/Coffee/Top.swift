//
//  Top.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class Top : Coffee {
    
    enum Kind : String {
        case caffelatte = "caffelatte"
        case americano = "americano"
        case black = "black"
    }
    
    let kind : Kind

    init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int, temperature: Int, kind: Top.Kind) {
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
        self.init(brand: "맥심",
                   capacity: 275,
                   price: 1700,
                   name: "맥심TOP",
                   createdAt: Date(),
                   expiredAt: Date().get7daysLatter(),
                   caffeine: 100,
                   temperature : 65,
                   kind: .black)
    }
    required init?(coder: NSCoder) {
        self.kind = Kind(rawValue: coder.decodeObject(forKey: "TopKind") as! String)!
        super.init(coder: coder)
    }
    override func encode(with coder: NSCoder) {
        coder.encode(kind.rawValue, forKey: "TopKind")
        super.encode(with: coder)
    }
}
