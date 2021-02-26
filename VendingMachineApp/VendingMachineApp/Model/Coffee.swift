//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Coffee : Beverage {
    private let caffeineContent : Int
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, caffeineContent : Int, expiration : Date, temperature : Int, calorie : Int) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, expiration : expiration, temperature : temperature, calorie : calorie)
    }
}
