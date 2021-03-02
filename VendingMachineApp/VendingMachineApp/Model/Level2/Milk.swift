//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class Milk: Beverage, CustomStringConvertible, SafeDateChecker {

    private var farmCode: String
    private var expiry: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, farmCode: String, expiry: Date) {
        self.farmCode = farmCode
        self.expiry = expiry
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture)
    }
    
    public func expirationValidate(with date: Date) -> Bool {
        return expiry > date
    }
}
