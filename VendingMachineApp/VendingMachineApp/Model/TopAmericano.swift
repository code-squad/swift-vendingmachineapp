//
//  TopAmericano.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class TopAmericano : Coffee {
    private let coffeeSolids : Double
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, caffeineContent: Int,expiryDate: Date,hot : Bool, calory : Int, coffeeSolids : Double) {
        self.coffeeSolids = coffeeSolids
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, caffeineContent: caffeineContent,expiryDate: expiryDate, hot : hot, calory : calory)
    }
    
}
