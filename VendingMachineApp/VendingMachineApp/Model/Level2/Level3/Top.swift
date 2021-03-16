//
//  Top.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Top: Coffee {
    private var hasSugar: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, temperature: Int, hasSugar: Bool, expiredAt: Date) {
        self.hasSugar = hasSugar
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, temperature: temperature, expiredAt: expiredAt)
    }
    
    required init() {
        self.hasSugar = false
        super.init(brand: "맥심",
                   capacity: 300,
                   price: 1000,
                   name: "탑",
                   manufacture: Date(),
                   temperature: 70,
                   expiredAt: Calendar.current.date(byAdding: .day, value: 30, to: Date())!
        )
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(hasSugar, forKey: "hasSugar")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.hasSugar = coder.decodeBool(forKey: "hasSugar")
        super.init(coder: coder)
    }
}
