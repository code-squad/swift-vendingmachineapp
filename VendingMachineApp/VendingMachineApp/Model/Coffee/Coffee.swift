//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/22.
//

import Foundation

enum CoffeeBrandName {
    
    case Top
    case Cantata
    case Georgia
}

class Coffee : Drink {
    
    private var isCoffeeBrandName: CoffeeBrandName
    
    init(isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, madeDate: Date) {
        self.isCoffeeBrandName = isCoffeeBrandName
        super.init(brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate)
    }
}
