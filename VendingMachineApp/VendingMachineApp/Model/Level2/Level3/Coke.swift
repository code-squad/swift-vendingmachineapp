//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Coke: Soda, LowCalorieChecker {
    
    private var calorie: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, taste: String, calorie: Int, expiredAt: Date) {
        self.calorie = calorie
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, taste: taste, expiredAt: expiredAt)
    }
    
    func isLowCalorie() -> Bool {
        let lowCalorie = 10
        
        return calorie < lowCalorie
    }
}
