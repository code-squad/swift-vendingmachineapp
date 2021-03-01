//
//  TopAmericano.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class TopAmericano : Coffee {
    private let coffeeSolids : Double
    
    init(brand: String, amount : Int, unit : Unit, price: Int, name: String, manufactured: Date, caffeineContent: Int,expiration: Date, temperature : Int, calorie : Int, coffeeSolids : Double) {
        self.coffeeSolids = coffeeSolids
        super.init(brand: brand, amount : amount, unit : unit, price: price, name: name, manufactured: manufactured, caffeineContent: caffeineContent, expiration : expiration, temperature : temperature, calorie : calorie)
    }
    
    convenience init() {
        self.init(brand : "맥심",
                  amount : 400,
                  unit : .Milliliter,
                  price: 3000,
                  name: "TOP아메리카노",
                  manufactured: Date.make(date: "20210217"),
                  caffeineContent: 130,
                  expiration: Date.make(date: "20210227"),
                  temperature : 70, calorie : 100,coffeeSolids: 0.7)
    }
}
