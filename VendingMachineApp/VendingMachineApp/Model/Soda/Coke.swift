//
//  Coke.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Coke: Soda {

    private let zeroCalorie: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, sugar: Int, zeroCalorie: Bool) {
        self.zeroCalorie = zeroCalorie
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, sugar: sugar)
    }
  
    required init() {
        zeroCalorie = false
        super.init(brand: "펩시코", volume: 355, price: 500, name: "펩시", createdAt: date, expiredAt: date, sugar: 40)
    }
    
    required init?(coder decoder: NSCoder) {
        zeroCalorie = decoder.decodeBool(forKey: "zeroCalorie")
        super.init(coder: decoder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(zeroCalorie, forKey: "zeroCalorie")
        super.encode(with: coder)
    }
    
    
    //MARK:- method
    
    func isZeroCalorie() -> Bool {
        return zeroCalorie
    }
}
