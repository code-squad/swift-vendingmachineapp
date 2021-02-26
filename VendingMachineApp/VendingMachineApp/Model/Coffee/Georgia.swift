//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

class Georgia: Coffee {
    
    override init(isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, madeDate: Date) {
        super.init(isCoffeeBrandName: isCoffeeBrandName, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate)
    }
}
