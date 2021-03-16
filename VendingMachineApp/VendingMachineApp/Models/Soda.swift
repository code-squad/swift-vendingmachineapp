//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Soda: Beverage{
    
    private var zeroCalorie: Bool
    
    override init(brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expiration: Date, hot: Bool, calorie: Int) {
        self.zeroCalorie = false
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expiration: expiration, hot: hot, calorie: calorie )
        self.zeroCalorie = self.isZeroCalorie(unit: calorie)
    }
    
    required init() {
        self.zeroCalorie = false
        super.init()
    }
    
    required init?(coder: NSCoder) {
        self.zeroCalorie = coder.decodeBool(forKey: "zeroCalorie")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(zeroCalorie, forKey: "zeroCalorie")
    }
    
    func isZeroCalorie(unit: Int) -> Bool {
        return unit < 4
    }
}
