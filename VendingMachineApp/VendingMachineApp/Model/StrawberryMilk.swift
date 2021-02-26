//
//  File.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class StrawberryMilk : Milk {
    private let strawberryContent : Int
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, mlikFarmCode : Int ,expiration : Date, temperature : Int, calorie : Int, strawberryContent : Int) {
        self.strawberryContent = strawberryContent
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, mlikFarmCode: mlikFarmCode, expiration: expiration, temperature : temperature, calorie: calorie)
    }
    
    
}
