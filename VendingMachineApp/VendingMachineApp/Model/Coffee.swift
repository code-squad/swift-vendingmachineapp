//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Coffee : Beverage {
    private let caffeineContent : Int
    
    init(brand: String, amount : Int, unit : Unit, price: Int, name: String, manufactured: Date, caffeineContent : Int, expiration : Date, temperature : Int, calorie : Int) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, amount : amount, unit : unit, price: price, name: name, manufactured: manufactured, expiration : expiration, temperature : temperature, calorie : calorie)
    }
    
    required init?(coder: NSCoder) {
        self.caffeineContent = coder.decodeInteger(forKey: "caffeineContent")
        super.init(coder: coder)
    }
    
    required init() {
        self.caffeineContent = 0
        super.init()
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(caffeineContent, forKey: "caffeineContent")
        super.encode(with: coder)
    }
}
