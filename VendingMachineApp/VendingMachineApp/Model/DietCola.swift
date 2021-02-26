//
//  DietCola.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class DietCola : Soda {
    enum taste {
        case lemon
        case lime
    }
    private let taste : taste
    
    init(brand: String, amount : Int, unit : Unit, price: Int, name: String, manufactured: Date, sugarContent : Int ,expiration: Date, temperature : Int, calorie : Int, taste : taste) {
        self.taste = .lemon
        super.init(brand: brand, amount : amount, unit : unit, price: price, name: name, manufactured: manufactured, sugarContent : sugarContent, expiration: expiration, temperature : temperature, calorie : calorie)
    }
    

}
