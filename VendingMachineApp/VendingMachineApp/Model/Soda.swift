//
//  Soda.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Soda : Beverage {
    private let calory : Int
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, calory : Int) {
        self.calory = calory
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured)
    }
}
