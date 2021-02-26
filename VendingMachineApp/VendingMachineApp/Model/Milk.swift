//
//  Milk.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Milk : Beverage {
    private let milkFarmCode : Int
    
    init(brand: String, amount : Int, unit : Unit, price: Int, name: String, manufactured: Date, mlikFarmCode : Int ,expiration : Date, temperature : Int, calorie : Int) {
        self.milkFarmCode = mlikFarmCode
        super.init(brand: brand, amount : amount, unit : unit, price: price, name: name, manufactured: manufactured, expiration: expiration, temperature : temperature, calorie: calorie)
    }
}
