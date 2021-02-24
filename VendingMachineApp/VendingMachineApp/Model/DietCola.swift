//
//  DietCola.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class DietCola : Soda {
    private let calory : Int
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, sugar : Bool ,calory: Int) {
        self.calory = calory
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, sugar: sugar)
    }
    
    func isLowCalorie() -> Bool {
        return calory < 5
    }
}
