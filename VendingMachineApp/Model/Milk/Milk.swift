//
//  Mink.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class Milk : Beverage {
    private let lowFat : Bool
    
    init(brand : String, capacity : Int, price : Int, name : String, createdAt : Date, expiredAt : Date, lowFat : Bool){
        self.lowFat = lowFat
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: Date(),
                   expiredAt: Date().get7daysLatter())
    }
    
    required init() {
        self.lowFat = false
        super.init()
    }
    required init?(coder: NSCoder) {
        self.lowFat = coder.decodeBool(forKey: "lowFat")
        super.init(coder: coder)
    }
    override func encode(with coder: NSCoder) {
        coder.encode(lowFat, forKey: "lowFat")
        super.encode(with: coder)
    }
}
