//
//  File.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class StrawberryMilk : Milk {
    private let strawberryContent : Int
    
    init(brand: String, amount : Int, unit : Unit, price: Int, name: String, manufactured: Date, mlikFarmCode : Int ,expiration : Date, temperature : Int, calorie : Int, strawberryContent : Int) {
        self.strawberryContent = strawberryContent
        super.init(brand: brand, amount : amount, unit : unit, price: price, name: name, manufactured: manufactured, mlikFarmCode: mlikFarmCode, expiration: expiration, temperature : temperature, calorie: calorie)
    }
    
    convenience init() {
        self.init(brand: "서울우유",
                  amount: 200,
                  unit: .Milliliter,
                  price: 1000,
                  name: "딸기우유",
                  manufactured: Date.make(date: "20210207"),
                  mlikFarmCode: 023,
                  expiration: Date.make(date: "20210210"),
                  temperature: 10,
                  calorie: 150,
                  strawberryContent: 10)
    }
    
    required init?(coder: NSCoder) {
        self.strawberryContent = coder.decodeInteger(forKey: "strawberryContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(strawberryContent, forKey: "strawberryContent")
        super.encode(with: coder)
    }
}
