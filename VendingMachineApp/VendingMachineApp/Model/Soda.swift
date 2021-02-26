//
//  Soda.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Soda : Beverage {
    private let sugar : Bool
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, sugar : Bool, expiration : Date, temperature : Int, calorie : Int) {
        self.sugar = sugar
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, expiration : expiration, temperature : temperature, calorie : calorie)
    }
}
