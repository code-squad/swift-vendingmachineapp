//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class Coke : Soda {
    enum Flaver : String {
        case cherry = "cherry"
        case vanilla = "vanilla"
    }
    let flaver : Flaver
    
    init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, flaver : Coke.Flaver) {
        self.flaver = flaver
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt)
    }
    
    convenience required init(){
        self.init(brand: "팹시",
                   capacity: 350,
                   price: 3500,
                   name: "코카콜라",
                   createdAt: Date(),
                   expiredAt: Date().get7daysLatter(),
                   flaver : .cherry)
    }
    required init?(coder: NSCoder) {
        self.flaver = Flaver(rawValue: coder.decodeObject(forKey: "Cokeflaver") as! String)!
        super.init(coder: coder)
    }
    override func encode(with coder: NSCoder) {
        coder.encode(flaver.rawValue, forKey: "Cokeflaver")
        super.encode(with: coder)
    }
}
