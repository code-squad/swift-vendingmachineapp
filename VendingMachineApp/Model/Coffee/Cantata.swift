//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class Cantata : Coffee {
    
    enum Kind :String {
        case sweetAmericano = "sweetAmericano"
        case premiumLette = "premiumLette"
        case caramelMacchiato = "caramelMacchiato"
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
    
    required init?(coder: NSCoder) {
        self.kind = Kind(rawValue: coder.decodeObject(forKey: "Cantatakind") as! String)!
        super.init(coder: coder)
    }
    override func encode(with coder: NSCoder) {
        coder.encode(kind.rawValue, forKey: "Cantatakind")
        super.encode(with: coder)
    }
}
