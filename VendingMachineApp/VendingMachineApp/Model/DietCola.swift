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
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, sugar : Bool ,expiration: Date, temperature : Int, calorie : Int, taste : taste) {
        self.taste = .lemon
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, sugar: sugar, expiration: expiration, temperature : temperature, calorie : calorie)
    }
    

}
