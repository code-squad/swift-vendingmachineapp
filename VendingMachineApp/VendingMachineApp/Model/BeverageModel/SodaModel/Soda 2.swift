//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Soda: Beverage {
    private var calories: Int
   
    init(brand: String, size: Int, price: Int, name: String, packageTime: Date, calories: Int) {
        self.calories = calories
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime)
    }
    
    convenience override init(brand: String, size: Int, price: Int, name: String, packageTime: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, calories: 0)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(calories, forKey: "calories")
        super.encode(with: coder)
    }
    
    required init?(coder eDecoder: NSCoder) {
        calories = eDecoder.decodeInteger(forKey: "calories")
        super.init(coder: eDecoder)
    }
    
    func isZeroCalorie() -> Bool {
        return self.calories == 0
    }
}
