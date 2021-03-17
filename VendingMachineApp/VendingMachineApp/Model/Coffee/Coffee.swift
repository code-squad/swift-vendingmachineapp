//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Coffee: Beverage {
    
    private let caffeine: Int
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int) {
        self.caffeine = caffeine
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt)
    }
    
    required init() {
        caffeine = 0
        super.init(brand: "brand", volume: 0, price: 0, name: "name", createdAt: Date(), expiredAt: Date())
    }
    
    required init?(coder decoder: NSCoder) {
        caffeine = decoder.decodeInteger(forKey: "caffeine")
        super.init(coder: decoder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(caffeine, forKey: "caffeine")
        super.encode(with: coder)
    }
    
    
    //MARK:- method
    
    func isLowCaffeine(criteria: Int) -> Bool {
        return caffeine <= criteria
    }
}
