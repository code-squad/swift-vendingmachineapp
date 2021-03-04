//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class Coffee: Beverage, CustomStringConvertible, Hotable {

    private var temperature: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, temperature: Int, expiredAt: Date) {
        self.temperature = temperature
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, expiredAt: expiredAt)
    }
    
    public func isHot() -> Bool {
        let hotTemperatue = 60
        
        return temperature > hotTemperatue
    }
}
