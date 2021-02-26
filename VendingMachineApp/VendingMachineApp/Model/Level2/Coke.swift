//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Coke: Soda {
    private var hasCalorie: Bool
    
    init(brand: String, miliLiter: Int, price: Int, name: String, dateOfManufacture: Date, taste: Taste, hasCalorie: Bool) {
        self.hasCalorie = hasCalorie
        super.init(brand: brand, miliLiter: miliLiter, price: price, name: name, dateOfManufacture: dateOfManufacture, taste: taste)
    }
}
