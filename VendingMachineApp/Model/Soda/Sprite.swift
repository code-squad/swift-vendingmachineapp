//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class Sprite : Soda {
    
    let lowSuger : Bool

    init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, lowSuger : Bool) {
        self.lowSuger = lowSuger
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt)

    }
    convenience required init() {
        self.init(brand: "칠성사이다",
                   capacity: 350,
                   price: 3500,
                   name: "코카콜라",
                   createdAt: Date(),
                   expiredAt: Date().get7daysLatter(),
                   lowSuger : false)
    }
    required init?(coder: NSCoder) {
        self.lowSuger = coder.decodeBool(forKey: "lowSuger")
        super.init(coder: coder)
    }
    override func encode(with coder: NSCoder) {
        coder.encode(lowSuger, forKey: "lowSuger")
        super.encode(with: coder)
    }
}
