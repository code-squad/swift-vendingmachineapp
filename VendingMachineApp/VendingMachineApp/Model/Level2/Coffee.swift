//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class Coffee: Beverage, CustomStringConvertible, Hotable {

    private var isHot: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, isHot: Bool) {
        self.isHot = isHot
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture)
    }
    
    public func checkHot() -> Bool {
        return isHot
    }
}
