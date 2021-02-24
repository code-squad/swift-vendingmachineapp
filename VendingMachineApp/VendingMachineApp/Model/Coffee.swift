//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Coffee : Beverage {
    private let caffeineContent : Int
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, caffeineContent : Int, expiryDate : Date, hot : Bool, calory : Int) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, expiryDate : expiryDate, hot : hot, calory : calory)
    }
}
