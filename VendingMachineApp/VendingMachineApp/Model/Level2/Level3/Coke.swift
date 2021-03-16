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
    
    required init() {
        self.calorie = 5
        super.init(brand: "코카콜라", capacity: 200, price: 1000, name: "콜라",manufacture: Date(), taste: "레몬맛", expiredAt: Calendar.current.date(byAdding: .day, value: 180, to: Date())!)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(calorie, forKey: "calorie")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        calorie = coder.decodeInteger(forKey: "calorie")
        super.init(coder: coder)
    }
    
    func isLowCalorie(over standard: Int) -> Bool {
        return calorie < standard
    }
}
