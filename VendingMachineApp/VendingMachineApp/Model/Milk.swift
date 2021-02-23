//
//  Milk.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Milk : Beverage {
    private let milkFarmCode : Int
    private let expiryDate : Date
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, mlikFarmCode : Int, expiryDate : Date) {
        self.milkFarmCode = mlikFarmCode
        self.expiryDate = expiryDate
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured)
    }
    
    func validate(with date:Date) -> Bool {
        return expiryDate < date
    }
}
