//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation


class Milk: Beverage, Expirable, LactoFreeable {
    
    private let expiry: Date
    private let lactose: Float
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date,
         expireAfter: Int, lactose: Float) {
        
        self.expiry = manufactured.add(amount: expireAfter)
        self.lactose = lactose
        
        super.init(brand: brand, name: name, price: price, size: size, manufactured: manufactured)
    }
    
    func isExpired() -> Bool {
        let today = Date()
        let isExpired = expiry < today
        return isExpired
    }
    
    func isLactoFree() -> Bool {
        return lactose == 0 ? true : false
    }
}

class Chocolate: Milk{
    
}

class Plain: Milk {
    
}
