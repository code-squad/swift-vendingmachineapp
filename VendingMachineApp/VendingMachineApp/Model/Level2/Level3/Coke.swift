//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Coke: Soda, LowCalorieChecker {
    
    private var hasCalorie: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, taste: Taste, hasCalorie: Bool) {
        self.hasCalorie = hasCalorie
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, taste: taste)
    }
    
    func isLowCalorie() -> Bool {
        return hasCalorie
    }
}
