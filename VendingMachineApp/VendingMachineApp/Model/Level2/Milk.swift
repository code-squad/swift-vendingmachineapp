//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class Milk: Beverage, CustomStringConvertible {
 
    private var farmCode: String
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, farmCode: String, expiredAt: Date) {
        self.farmCode = farmCode
   
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, expiredAt: expiredAt)
    }
}
