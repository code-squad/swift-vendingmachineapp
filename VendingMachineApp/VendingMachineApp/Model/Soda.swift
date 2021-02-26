//
//  Soda.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Soda : Beverage {
    private let sugarContent : Int
    
    init(brand: String, amount : Int, unit : Unit, price: Int, name: String, manufactured: Date, sugarContent : Int, expiration : Date, temperature : Int, calorie : Int) {
        self.sugarContent = sugarContent
        super.init(brand: brand, amount : amount, unit : unit, price: price, name: name, manufactured: manufactured, expiration : expiration, temperature : temperature, calorie : calorie)
    }
}
