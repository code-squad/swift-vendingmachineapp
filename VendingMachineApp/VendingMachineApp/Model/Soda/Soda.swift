//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Soda: Beverage {
    
    private let sugar: Int
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, sugar: Int) {
        self.sugar = sugar
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt)
    }
  
    required init() {
        sugar = 0
        super.init(brand: "brand", volume: 0, price: 0, name: "name", createdAt: Date(), expiredAt: Date())
    }
    
    required init?(coder decoder: NSCoder) {
        sugar = decoder.decodeInteger(forKey: "sugar")
        super.init(coder: decoder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(sugar, forKey: "sugar")
        super.encode(with: coder)
    }
    
    
    //MARK:- method
    
    func isLowSugar(criteria: Int) -> Bool {
        return sugar <= criteria
    }
}
